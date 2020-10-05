import 'package:flutter/material.dart';
import '../screens/Splash.dart';
import '../screens/Home.dart';
import '../screens/Cart.dart';
import '../screens/Tabs.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (_) => Splash(),
  Home.routeName: (_) => Tabs(),
  Cart.routeName: (_) => Cart()
};
