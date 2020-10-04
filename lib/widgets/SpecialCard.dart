import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class SpecialCard extends StatelessWidget {
  final String title;
  final int price;
  final String image;
  SpecialCard(
      {@required this.title, @required this.image, @required this.price});
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
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(20)),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kSecondaryColor.withOpacity(0.1)),
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(color: Colors.black),
              maxLines: 2,
            ),
            Text(
              "₹$price",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(18),
                  fontWeight: FontWeight.w600,
                  color: kPrimaryColor),
            )
          ],
        ),
      ),
    );
  }
}
