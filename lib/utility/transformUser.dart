import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluteco/models/User.dart';

AppUser transformUser(User user) {
  print(user.uid);
  return AppUser(
    uid: user.uid,
  );
}
