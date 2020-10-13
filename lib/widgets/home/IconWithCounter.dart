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
          padding: EdgeInsets.all(getProportionateScreenWidth(16)),
          child: Icon(Icons.shopping_cart),
        ),
        if (count != 0)
          Positioned(
            top: getProportionateScreenWidth(8),
            right: getProportionateScreenWidth(9),
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
                      height: 1,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
          )
      ]),
    );
  }
}
