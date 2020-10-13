import 'package:flutter/material.dart';
import '../../resources/size_config.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFFFE6E6),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
          )),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(60),
      child: Icon(
        Icons.favorite,
        color: Colors.pink[400],
      ),
    );
  }
}
