import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/providers/Products.dart';
import 'package:fluteco/screens/Product.dart';
import 'package:fluteco/screens/edit_product.dart';
import 'package:flutter/material.dart';
import '../screens/Splash.dart';
import '../screens/Home.dart';
import '../screens/Cart.dart';
import '../screens/Tabs.dart';
import '../screens/Category.dart';
import '../screens/PageNotFound.dart';
import '../screens/FlutecoSpecial.dart';
import '../screens/Genres.dart';
import 'package:provider/provider.dart';

final Map<String, WidgetBuilder> routes = {
  Splash.routeName: (_) => Splash(),
  Home.routeName: (_) => Tabs(),
  CartScreen.routeName: (_) => CartScreen(),
  FlutecoSpecial.routeName: (_) => FlutecoSpecial(),
  Genres.routeName: (_) => Genres(),
  EditProduct.routeName: (_) => EditProduct()
};

Route<dynamic> generateRoutes(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case '/categories':
      {
        return MaterialPageRoute(
            builder: (context) => CategoryScreen(category: arguments));
      }

    case '/products':
      {
        // products.singleWhere((product) => product.id == arguments)
        print(settings.arguments);
        return MaterialPageRoute(builder: (context) {
          var products = Provider.of<Products>(context).products;
          Product _product;
          products.forEach((_, value) {
            value.forEach((k, v) {
              if (k == arguments) _product = v;
            });
          });
          return ChangeNotifierProvider.value(
              value: _product, child: ProductScreen());
        });
      }
    default:
      {
        return MaterialPageRoute(builder: (context) => PageNotFound());
      }
  }
}
