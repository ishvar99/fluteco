import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import '../data/limit.dart';

class NetworkHelper {
  Future<String> uploadProductImage(PlatformFile image) async {
    print(image);
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

  CollectionReference getAllProducts() {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    return FirebaseFirestore.instance.collection('products');
  }

  Query getProductsByCategory(String category) {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    Query categoryProducts = FirebaseFirestore.instance
        .collection('products')
        .where("category", isEqualTo: category);
    return categoryProducts;
  }

  Query getSpecialProducts() {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    Query specialProducts = FirebaseFirestore.instance
        .collection('products')
        .where('discount', isGreaterThanOrEqualTo: thresholdDiscount);
    return specialProducts;
  }

  DocumentReference getProduct(String id) {
    FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
    DocumentReference product =
        FirebaseFirestore.instance.collection('products').doc(id);
    return product;
  }

  Future<void> updateProduct(
      {@required String id, @required Map<String, dynamic> productData}) async {
    print('update triggered');
    await FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .update(productData);
  }

  Future<void> toggleFavourite(String id, bool status) async {
    await FirebaseFirestore.instance
        .collection('products')
        .doc(id)
        .update({'favourite': status});
  }

  Future<void> deleteProduct(String id) async {
    await FirebaseFirestore.instance.collection('products').doc(id).delete();
  }
}
