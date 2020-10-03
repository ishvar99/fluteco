import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../widgets/OfferBanner.dart';
import '../../widgets/Category.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OfferBanner(),
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Category(
                icon: Image.asset('assets/icons/jewel.png'),
                text: "Jewels",
              ),
              Category(
                icon: Image.asset('assets/icons/clothes.png'),
                text: "Fashion",
              ),
              Category(
                icon: Image.asset('assets/icons/kitchenwares.png'),
                text: "Kitchen",
              ),
              // Category(
              //     icon: Image.asset('assets/icons/stationary.png'),
              //     text: "Stationary"),
              Category(
                icon: Image.asset('assets/icons/food.png'),
                text: "Eatables",
              ),
              // Category(
              //   icon: Image.asset('assets/icons/confectionary.png'),
              //   text: "Confectionary",
              // ),
              // Category(
              //   icon: Image.asset('assets/icons/home_decor.png'),
              //   text: "Home and Decor",
              // ),
              Category(
                icon: Image.asset('assets/icons/electronics.png'),
                text: "Electronics",
              )
            ],
          ),
        )
      ],
    );
  }
}
