import '../../resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:fluteco/resources/size_config.dart';

class IconWithCounter extends StatelessWidget {
  final int count;
  final Function press;
  const IconWithCounter({Key key, @required this.count, this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Stack(overflow: Overflow.visible, children: [
        Container(
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
        if (count != 0)
          Positioned(
            bottom: getProportionateScreenWidth(18),
            left: getProportionateScreenWidth(17),
            child: Container(
              width: getProportionateScreenWidth(15),
              height: getProportionateScreenWidth(15),
              decoration: BoxDecoration(
                color: kOfferBannerColor,
                shape: BoxShape.circle,
                // border: Border.all(width: 0.5, color: Colors.white),
              ),
              child: Center(
                child: Text(
                  count.toString(),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getProportionateScreenWidth(10),
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
      ]),
    );
  }
}
