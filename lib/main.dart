// import 'package:fluteco/utility/connectivity.dart';

import 'package:fluteco/models/User.dart';
import 'package:fluteco/services/FirebaseAuthHelper.dart';

import './providers/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './resources/constants.dart';
import './resources/routes.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  // ConnectionStatusSingleton connectionStatus =
  //     ConnectionStatusSingleton.getInstance();
  // connectionStatus.initialize();
  runApp(
    StreamProvider<AppUser>.value(
      value: FireBaseAuthHelper().isAuthenticated(),
      child: Main(),
    ),
  );
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: routes,
      onGenerateRoute: generateRoutes,
      title: "Fluteco",
      theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          accentColor: kOfferBannerColor,
          scaffoldBackgroundColor: Colors.white,
          fontFamily: "Muli",
          textTheme: TextTheme(bodyText1: TextStyle(color: kTextColor)),
          visualDensity: VisualDensity.adaptivePlatformDensity),
    );
  }
}
