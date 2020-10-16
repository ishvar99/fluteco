import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../providers/Product.dart';
import 'package:provider/provider.dart';

class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        product.toggleFavouriteStatus();
      },
      splashColor: Colors.pink,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(60),
        child: Icon(product.favourite ? Icons.favorite : Icons.favorite_border,
            color: Colors.pink[500], size: 22),
      ),
    );
  }
}
