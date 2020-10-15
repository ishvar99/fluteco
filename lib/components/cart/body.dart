import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../providers/Product.dart';
import '../../widgets/cart/CartProduct.dart';

Padding displayCart(List<Product> products) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: getProportionateScreenWidth(25),
    ),
    child: ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) => CartProduct(
        product: products[index],
      ),
    ),
  );
}
