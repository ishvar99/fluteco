import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/product/Button.dart';
import '../../providers/Product.dart';
import '../../providers/Cart.dart';

Container displayBottomNavigationBar(BuildContext context, Product product) {
  final cart = Provider.of<Cart>(context, listen: false);
  return Container(
    height: getProportionateScreenWidth(60),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Button(
              text: "ADD TO CART",
              tapped: () {
                cart.addItem(
                    productId: product.id,
                    price: product.price,
                    title: product.name);
              }),
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
