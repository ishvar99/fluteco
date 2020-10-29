import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/providers/Product.dart';
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
    CollectionReference collectionReferece =
        FirebaseFirestore.instance.collection('products');
    return collectionReferece.add(productData);
  }

  Future<List<Product>> getSelectedProducts() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('products')
        .limit(flutecoSpecialHome)
        .get();
    List<Product> productList = querySnapshot.docs.map((doc) {
      print(doc.data()['imageUrl']);
      return Product(
        id: doc.id,
        name: doc.data()['name'],
        originalPrice: doc.data()['originalPrice'],
        discount: doc.data()['discount'],
        discountedPrice: doc.data()['discountedPrice'],
        imageUrl: doc.data()['imageUrl'],
        limit: doc.data()['limit'],
        category: doc.data()['category'],
        description: doc.data()['description'],
      );
    }).toList();
    return productList;
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where("category", isEqualTo: category)
          .get();
      List<Product> productList = querySnapshot.docs.map((doc) {
        print(doc.data()['imageUrl']);
        return Product(
          id: doc.id,
          name: doc.data()['name'],
          originalPrice: doc.data()['originalPrice'],
          discount: doc.data()['discount'],
          discountedPrice: doc.data()['discountedPrice'],
          imageUrl: doc.data()['imageUrl'],
          limit: doc.data()['limit'],
          category: doc.data()['category'],
          description: doc.data()['description'],
        );
      }).toList();
      return productList;
    } catch (error) {
      print(error);
      return [];
    }
  }
}
