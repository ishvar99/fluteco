import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/models/User.dart';
import 'package:fluteco/utility/transformUser.dart';

class FireBaseAuthHelper {
  Stream<AppUser> isAuthenticated() {
    return FirebaseAuth.instance.authStateChanges().map(transformUser);
  }

  Future<void> updateProfile(String firstName, String lastName, int phoneNumber,
      String deliveryAddress) async {
    await FirebaseAuth.instance.currentUser
        .updateProfile(displayName: "$firstName $lastName");
    await FirebaseAuth.instance.currentUser.reload();
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
