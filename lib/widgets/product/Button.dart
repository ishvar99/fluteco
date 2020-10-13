import 'package:flutter/material.dart';
import '../../resources/size_config.dart';

class Button extends StatelessWidget {
  final String text;
  final Function tapped;
  const Button({
    this.text,
    this.tapped,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tapped,
      child: Container(
        decoration: BoxDecoration(
          color: text == "ADD TO CART" ? Color(0xFFF5F6F9) : Colors.deepOrange,
          boxShadow: [
            BoxShadow(
                color: text == "ADD TO CART"
                    ? Colors.black.withOpacity(0.2)
                    : Colors.black.withOpacity(0.3),
                offset: Offset(
                    text == "ADD TO CART"
                        ? getProportionateScreenWidth(3.0)
                        : getProportionateScreenWidth(6.0),
                    0.0),
                spreadRadius: 3.0,
                blurRadius: 5.0),
          ],
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: text == "ADD TO CART" ? Colors.black : Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
