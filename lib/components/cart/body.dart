import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../providers/Cart.dart';
import '../../widgets/cart/CartProduct.dart';

Padding displayCart(Map<String, CartItem> cartProducts) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(25),
    ),
    child: ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) => CartProduct(
        product: cartProducts.values.elementAt(index),
      ),
    ),
  );
}
