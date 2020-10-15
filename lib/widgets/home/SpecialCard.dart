import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';
import './ImageCard.dart';

class SpecialCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  final Function tapped;
  SpecialCard(
      {@required this.title,
      @required this.image,
      @required this.price,
      @required this.tapped});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCard(tapped: tapped, image: image),
            const SizedBox(height: 5),
            Text(
              title,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(7)),
                child: Text(
                  "₹$price",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
              ),
              Text(
                "₹999",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kOfferBannerColor),
              ),
              Spacer(),
              Icon(
                Icons.favorite_border,
                size: getProportionateScreenWidth(20),
                color: Colors.pink[500],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
