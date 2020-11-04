import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/product/Button.dart';
import '../../providers/Product.dart';
import '../../providers/Cart.dart';

Container displayBottomNavigationBar(
    BuildContext context, Product product, bool inCart) {
  final NetworkHelper helper = NetworkHelper();
  return Container(
    height: getProportionateScreenWidth(60),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Consumer<Cart>(
            builder: (context, cart, _) => Button(
                text: inCart //product.id
                    ? "GO TO CART"
                    : "ADD TO CART",
                tapped: () async {
                  if (inCart) {
                    //product.id
                    Navigator.pushNamed(context, '/cart');
                  } else {
                    await helper.addToCart(productData: {
                      "productId": product.id,
                      "price": product.discountedPrice,
                      "image": product.imageUrl,
                      "limit": product.limit,
                      "title": product.name
                    });
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
