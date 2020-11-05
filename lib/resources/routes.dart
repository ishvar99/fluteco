import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/providers/Products.dart';
import 'package:fluteco/screens/Product.dart';
import 'package:fluteco/screens/edit_product.dart';
import 'package:fluteco/screens/order.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:fluteco/utility/transformQuerySnapshot.dart';
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
  EditProduct.routeName: (_) => EditProduct(),
  Order.routeName: (_) => Order()
};

Route<dynamic> generateRoutes(RouteSettings settings) {
  final arguments = settings.arguments;
  NetworkHelper helper = NetworkHelper();
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
          return StreamBuilder<DocumentSnapshot>(
              stream: helper.getProduct(settings.arguments).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text('Something went wrong'));
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ChangeNotifierProvider.value(
                    value: transformQuerySnapshot(snapshot.data),
                    child: ProductScreen());
              });
        });
      }
    default:
      {
        return MaterialPageRoute(builder: (context) => PageNotFound());
      }
  }
}
