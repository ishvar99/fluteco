import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final int rating;
  RatingCard({@required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
                rating,
                (index) => Icon(
                      Icons.star,
                      color: Colors.orange,
                    )),
            ...List.generate(
              5 - rating,
              (index) => Icon(
                Icons.star_border,
                color: Colors.orange,
              ),
            ),
            SizedBox(
              width: getProportionateScreenWidth(20),
            ),
            Text(
              "8175 Buyers",
              style: TextStyle(
                  color: kOfferBannerColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            )
          ]),
    );
  }
}
