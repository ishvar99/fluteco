import '../resources/constants.dart';
import 'package:flutter/material.dart';
import '../resources/size_config.dart';

class OfferBanner extends StatelessWidget {
  const OfferBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(20),
        // horizontal: getProportionateScreenWidth(10),
      ),
      child: AnimatedContainer(
        duration: kAnimationDuration,
        decoration: BoxDecoration(
          color: kOfferBannerColor,
          // borderRadius: BorderRadius.circular(20.0),
        ),
        width: double.infinity,
        child: Container(
          width: double.infinity,
          child: Padding(
            padding:
                EdgeInsets.symmetric(vertical: getProportionateScreenWidth(30)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('BUMPER OFFER',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(15))),
                    Text(
                      'FLAT 25% OFF*',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: getProportionateScreenWidth(25),
                          fontWeight: FontWeight.w900),
                    ),
                  ],
                ),
                Image.asset("assets/icons/sale.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
