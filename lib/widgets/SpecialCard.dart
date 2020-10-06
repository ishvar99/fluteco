import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

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
            AspectRatio(
              aspectRatio: 1.02,
              child: InkWell(
                  borderRadius: BorderRadius.circular(15.0),
                  onTap: tapped,
                  child: Container(
                    padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: kSecondaryColor.withOpacity(0.08),
                      // color: Colors.deepOrange[50],
                    ),
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,
                    ),
                  )),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
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
                color: Colors.red,
              )
            ]),
          ],
        ),
      ),
    );
  }
}
