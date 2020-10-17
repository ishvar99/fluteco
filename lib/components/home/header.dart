import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/IconWithCounter.dart';
import '../../widgets/home/SearchBar.dart';
import '../../providers/Cart.dart';

AppBar header(BuildContext context) {
  final cart = Provider.of<Cart>(context);
  return AppBar(
    title: Text(
      'Fluteco',
      style: TextStyle(fontWeight: FontWeight.w900),
    ),
    actions: [
      IconWithCounter(
          count: cart.items.length,
          press: () {
            Navigator.pushNamed(context, '/cart');
          }),
      SizedBox(
        width: 15,
      ),
    ],
    bottom: PreferredSize(
        child: SearchBar(),
        preferredSize: Size.fromHeight(getProportionateScreenHeight(80))),
  );
}
