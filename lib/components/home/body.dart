import 'package:flutter/material.dart';
import '../../resources/constants.dart';
import '../../resources/size_config.dart';
import '../../widgets/BannerCarousel.dart';
import '../../widgets/Category.dart';
import '../../widgets/SpecialCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerCarousel(),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              child: Row(
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
                  Category(
                      icon: Image.asset('assets/icons/stationary.png'),
                      text: "Stationary"),
                  Category(
                    icon: Image.asset('assets/icons/food.png'),
                    text: "Eatables",
                  ),
                  Category(
                    icon: Image.asset('assets/icons/confectionary.png'),
                    text: "Groceries",
                  ),
                  Category(
                    icon: Image.asset('assets/icons/home_decor.png'),
                    text: "Home",
                  ),
                  Category(
                    icon: Image.asset('assets/icons/electronics.png'),
                    text: "Electronics",
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(18)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special for you',
                style: TextStyle(
                    color: kOfferBannerColor,
                    fontSize: getProportionateScreenWidth(16),
                    fontWeight: FontWeight.w900),
              ),
              Text(
                'See More',
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(12),
                    color: kTextColor),
              )
            ],
          ),
        ),
        SizedBox(
          height: getProportionateScreenHeight(15),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialCard(
                category: "Smartphones",
                numOfCount: 18,
                image: "assets/images/Image Banner 2.png",
              ),
              SpecialCard(
                category: "Fashion",
                numOfCount: 30,
                image: "assets/images/Image Banner 3.png",
              ),
              SpecialCard(
                category: "Smartphones",
                numOfCount: 18,
                image: "assets/images/Image Banner 2.png",
              ),
              SpecialCard(
                category: "Fashion",
                numOfCount: 30,
                image: "assets/images/Image Banner 3.png",
              )
            ],
          ),
        ),
      ],
    );
  }
}
