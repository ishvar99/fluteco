import 'package:flutter/material.dart';
import '../screens/Splash.dart';
import '../screens/Home.dart';
import '../screens/Cart.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (_) => Splash(),
  Home.routeName: (_) => Home(),
  Cart.routeName: (_) => Cart()
};
