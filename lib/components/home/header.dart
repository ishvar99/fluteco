import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/IconWithCounter.dart';
import '../../widgets/home/SearchBar.dart';
import '../../providers/Cart.dart';

AppBar header(BuildContext context) {
  return AppBar(
    titleSpacing: getProportionateScreenWidth(10),
    toolbarHeight: getProportionateScreenWidth(130),
    title: Text(
      'Fluteco',
      style: TextStyle(fontWeight: FontWeight.w900),
    ),
    actions: [
      Icon(Icons.notifications),
      SizedBox(
        width: getProportionateScreenWidth(15),
      ),
      IconWithCounter(
          count: 2,
          press: () {
            Navigator.pushNamed(context, '/cart');
          }),
      SizedBox(
        width: getProportionateScreenWidth(20),
      ),
    ],
    bottom: PreferredSize(
        child: SearchBar(),
        preferredSize: Size.fromHeight(getProportionateScreenHeight(75))),
  );
}
