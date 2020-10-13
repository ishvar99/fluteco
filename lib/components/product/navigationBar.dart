import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../widgets/product/Button.dart';

Container displayBottomNavigationBar() {
  return Container(
    height: getProportionateScreenWidth(60),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Button(text: "ADD TO CART", tapped: () {}),
        ),
        Expanded(
          child: Button(
            text: "BUY NOW",
            tapped: () {},
          ),
        ),
      ],
    ),
  );
}
