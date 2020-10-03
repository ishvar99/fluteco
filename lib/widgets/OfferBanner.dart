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
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Container(
          decoration: BoxDecoration(
            color: kOfferBannerColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          height: getProportionateScreenHeight(120),
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(getProportionateScreenWidth(15)),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Mega Offer',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: getProportionateScreenWidth(15))),
                  Text(
                    'Flat 25% Cashback',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: getProportionateScreenWidth(25),
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
