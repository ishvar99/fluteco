import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/IconWithCounter.dart';
import '../../widgets/home/SearchBar.dart';

AppBar header(BuildContext context) {
  return AppBar(
    title: Text(
      'Fluteco',
      style: TextStyle(fontWeight: FontWeight.w900),
    ),
    actions: [
      IconWithCounter(
          count: 2,
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
