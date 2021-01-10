import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  final String id;
  final String email;
  final String profilePhotoUrl;
  final String name;
  final String address;
  final String pinCode;
  final int phoneNumber;
  AppUser(
      {this.id,
      this.name,
      this.email,
      this.profilePhotoUrl,
      this.address,
      this.phoneNumber,
      this.pinCode});

  factory AppUser.fromDocument(DocumentSnapshot doc) {
    print(doc);
    return AppUser(
        id: doc.data()['uid'],
        name: doc.data()['name'],
        email: doc.data()['email'],
        profilePhotoUrl: doc.data()['profilePhotoUrl'],
        address: doc.data()['address'],
        phoneNumber: doc.data()['phoneNumber'],
        pinCode: doc.data()['pinCode']);
  }
}
