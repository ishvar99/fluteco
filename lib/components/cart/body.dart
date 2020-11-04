import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../providers/Cart.dart';
import '../../widgets/cart/CartProduct.dart';

Padding displayCart(List<QueryDocumentSnapshot> cartProducts) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(25),
    ),
    child: ListView.builder(
      itemCount: cartProducts.length,
      itemBuilder: (context, index) => CartProduct(
        cartProduct: cartProducts[index],
        // productId: cartProducts.keys.elementAt(index),
      ),
    ),
  );
}
