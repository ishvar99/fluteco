import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/models/User.dart';

AppUser transformUser(User user) {
  return AppUser(
    uid: user.uid,
  );
}
