import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/data/categories.dart';
import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/providers/Products.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import '../data/limit.dart';

class NetworkHelper {
  Future<String> uploadProductImage(PlatformFile image) async {
    final StorageReference storageReference =
        FirebaseStorage().ref().child("images/${image.name}");
    final StorageUploadTask uploadTask =
        storageReference.putFile(File(image.path));
    StorageTaskSnapshot snapshot = await uploadTask.onComplete;
    String downloadUrl;
    if (snapshot.error == null) {
      downloadUrl = await snapshot.ref.getDownloadURL();
    } else {
      downloadUrl = "";
    }
    return downloadUrl;
  }

  Future<DocumentReference> uploadProduct(
      {@required Map<String, dynamic> productData}) async {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    CollectionReference collectionReferece =
        FirebaseFirestore.instance.collection('products');
    return collectionReferece.add(productData);
  }

  // Future<List<Product>> getHomeProducts() async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('products')
  //       .where('discount', isGreaterThan: 25)
  //       .limit(flutecoSpecialHome)
  //       .get();
  //   List<Product> productList = querySnapshot.docs.map((doc) {
  //     print(doc.data()['imageUrl']);
  //     return Product(

  //       name: doc.data()['name'],
  //       originalPrice: doc.data()['originalPrice'],
  //       discount: doc.data()['discount'],
  //       discountedPrice: doc.data()['discountedPrice'],
  //       imageUrl: doc.data()['imageUrl'],
  //       limit: doc.data()['limit'],
  //       category: doc.data()['category'],
  //       description: doc.data()['description'],
  //     );
  //   }).toList();
  //   return productList;
  // }

  Future<Map<String, Map<String, Product>>> getAllProducts(
      Map<String, Map<String, Product>> products) async {
    Map<String, Map<String, Product>> _products = products;
    _products['special'] = {};
    categories.forEach((e) {
      _products[e.text] = {};
    });

    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    querySnapshot.docs.forEach((doc) {
      Product _product = Product(
          id: doc.id,
          name: doc.data()['name'],
          originalPrice: doc.data()['originalPrice'],
          discount: doc.data()['discount'],
          discountedPrice: doc.data()['discountedPrice'],
          imageUrl: doc.data()['imageUrl'],
          limit: doc.data()['limit'],
          category: doc.data()['category'],
          description: doc.data()['description'],
          favourite: doc.data()['favourite']);
      if (_product.discount >= thresholdDiscount) {
        _products['special'].putIfAbsent(doc.id, () => _product);
      } else {
        _products[_product.category].putIfAbsent(doc.id, () => _product);
      }
    });
    return _products;
  }

  Future<Map<String, Map<String, Product>>> getProductsByCategory(
      Map<String, Map<String, Product>> products, String category) async {
    QuerySnapshot querySnapshot;
    Map<String, Map<String, Product>> _products = products;
    _products[category] = {};
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: category)
        .get();
    if (querySnapshot.docs.length == 0) return products;
    querySnapshot.docs.forEach((doc) {
      Product _product = Product(
          id: doc.id,
          name: doc.data()['name'],
          originalPrice: doc.data()['originalPrice'],
          discount: doc.data()['discount'],
          discountedPrice: doc.data()['discountedPrice'],
          imageUrl: doc.data()['imageUrl'],
          limit: doc.data()['limit'],
          category: doc.data()['category'],
          description: doc.data()['description'],
          favourite: doc.data()['favourite']);
      _products[category].putIfAbsent(doc.id, () => _product);
      print("products $_products");
    });
    return _products;
  }

  Future<Map<String, Map<String, Product>>> getSpecialProducts(
      Map<String, Map<String, Product>> products) async {
    Map<String, Map<String, Product>> _products = products;
    _products['special'] = {};
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .where('discount', isGreaterThanOrEqualTo: thresholdDiscount)
        .get();
    if (querySnapshot.docs.length == 0) return products;
    querySnapshot.docs.forEach((doc) {
      Product _product = Product(
          id: doc.id,
          name: doc.data()['name'],
          originalPrice: doc.data()['originalPrice'],
          discount: doc.data()['discount'],
          discountedPrice: doc.data()['discountedPrice'],
          imageUrl: doc.data()['imageUrl'],
          limit: doc.data()['limit'],
          category: doc.data()['category'],
          description: doc.data()['description'],
          favourite: doc.data()['favourite']);
      _products['special'].putIfAbsent(doc.id, () => _product);
    });
    return _products;
  }

  Future<void> toggleFavourite(String id, bool status) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .update({'favourite': status});
  }
}
