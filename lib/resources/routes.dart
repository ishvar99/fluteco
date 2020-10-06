import 'package:fluteco/screens/Product.dart';
import 'package:flutter/material.dart';
import '../screens/Splash.dart';
import '../screens/Home.dart';
import '../screens/Cart.dart';
import '../screens/Tabs.dart';
import '../screens/Category.dart';
import '../screens/PageNotFound.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (_) => Splash(),
  Home.routeName: (_) => Tabs(),
  Cart.routeName: (_) => Cart(),
};

Route<dynamic> generateRoutes(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case '/categories':
      {
        return MaterialPageRoute(
            builder: (context) => Category(type: arguments));
      }

    case '/products':
      {
        print(settings.arguments);
        return MaterialPageRoute(
            builder: (context) => ProductScreen(id: arguments));
      }
    default:
      {
        return MaterialPageRoute(builder: (context) => PageNotFound());
      }
  }
}
