import 'package:flutter/material.dart';
import '../screens/Splash.dart';
import '../screens/Home.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (_) => Splash(),
  Home.routeName: (_) => Home()
};
