import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../models/Product.dart';

class FavouriteButton extends StatefulWidget {
  final Product product;
  const FavouriteButton({
    Key key,
    @required this.product,
  }) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
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
        child: Icon(
            widget.product.favourite ? Icons.favorite : Icons.favorite_border,
            color: Colors.pink[500],
            size: 22),
      ),
    );
  }
}
