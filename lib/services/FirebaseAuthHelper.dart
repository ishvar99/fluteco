import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/models/User.dart';
import 'package:fluteco/utility/transformUser.dart';

class FireBaseAuthHelper {
  Stream<AppUser> isAuthenticated() {
    return FirebaseAuth.instance.authStateChanges().map(transformUser);
  }

  Future<void> updateProfile(
      String firstName, String lastName, String profile) async {
    var user = FirebaseAuth.instance.currentUser;
    await user.updateProfile(
        displayName: "$firstName $lastName", photoURL: profile);

    await user.reload();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .set({'profilePhotoUrl': user.photoURL, 'name': user.displayName});
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
