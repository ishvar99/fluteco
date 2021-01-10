import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/models/User.dart';
import '../models/User.dart';

class FireBaseAuthHelper {
  // Stream<AppUser> isAuthenticated() {
  //   return FirebaseAuth.instance.authStateChanges().map(transformUser);
  // }

  Future<void> updateProfile(
      {String firstName,
      String lastName,
      String profile,
      String address,
      String pinCode,
      int phoneNumber}) async {
    var user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(user.uid).set(
      {
        'uid': user.uid,
        'profilePhotoUrl': profile,
        'name': '$firstName $lastName',
        'address': address,
        'pinCode': pinCode,
        'phoneNumber': phoneNumber
      },
    );
  }

  Future<AppUser> getCurrentUser() async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    DocumentSnapshot userDoc =
        await FirebaseFirestore.instance.collection('users').doc(userId).get();
    return AppUser.fromDocument(userDoc);
  }

  Future<UserCredential> registerUser(String email, String password) async {
    UserCredential userCredential;
    try {
      userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return userCredential;
  }
}
