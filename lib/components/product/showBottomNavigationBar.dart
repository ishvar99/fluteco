import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/product/Button.dart';
import '../../providers/Product.dart';
import '../../providers/Cart.dart';

Container displayBottomNavigationBar(BuildContext context, Product product) {
  return Container(
    height: getProportionateScreenWidth(60),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Consumer<Cart>(
            builder: (context, cart, _) => Button(
                text: cart.items.containsKey(product.id)
                    ? "GO TO CART"
                    : "ADD TO CART",
                tapped: () {
                  if (cart.items.containsKey(product.id)) {
                    Navigator.pushNamed(context, '/cart');
                  } else {
                    cart.addItem(
                        productId: product.id,
                        price: product.price,
                        image: product.image,
                        title: product.name);
                    final snackBar = SnackBar(
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(milliseconds: 500),
                      content: Text(
                        'Product added to the cart!',
                        textAlign: TextAlign.center,
                      ),
                    );
                    Scaffold.of(context).showSnackBar(snackBar);
                  }
                }),
          ),
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
