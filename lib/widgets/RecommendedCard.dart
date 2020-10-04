import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class RecommendedCard extends StatelessWidget {
  final String image;
  final String category;
  final int availability;
  RecommendedCard(
      {@required this.image,
      @required this.category,
      @required this.availability});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
            width: getProportionateScreenWidth(310),
            height: getProportionateScreenHeight(170),
          ),
          Container(
            width: getProportionateScreenWidth(310),
            height: getProportionateScreenHeight(170),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF343434).withOpacity(0.5),
                  Color(0xFF343434).withOpacity(0.15)
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(15),
                vertical: getProportionateScreenWidth(10)),
            child: Text.rich(
                TextSpan(style: TextStyle(color: Colors.white), children: [
              TextSpan(
                text: "$category\n",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(text: "More than $availability Brands")
            ])),
          )
        ]),
      ),
    );
  }
}
