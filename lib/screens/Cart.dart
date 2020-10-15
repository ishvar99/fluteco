import 'package:fluteco/providers/Products.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart/CheckoutCard.dart';
import '../components/cart/body.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).products;
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Cart'),
        ),
        bottomNavigationBar: CheckoutCard(),
        body: displayCart(products));
  }
}
