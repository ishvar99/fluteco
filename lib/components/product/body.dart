import 'package:flutter/material.dart';
import '../../models/Product.dart';
import '../../resources/size_config.dart';
import '../../resources/constants.dart';
import '../../widgets/product/RatingCard.dart';
import '../../widgets/product/FavouriteButton.dart';

Padding displayContent(Product product) {
  return Padding(
    padding: EdgeInsets.only(left: getProportionateScreenWidth(20.0)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              right: getProportionateScreenWidth(20),
              top: getProportionateScreenWidth(20)),
          child: Container(
            alignment: Alignment.center,
            child: Image.asset(
              product.image,
              height: getProportionateScreenWidth(200),
            ),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(10.0),
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          child: RatingCard(
            rating: 4,
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(25.0),
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20.0)),
          child: Text("${product.name}",
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(24),
                  fontWeight: FontWeight.bold,
                  color: kOfferBannerColor)),
        ),
        SizedBox(
          height: getProportionateScreenWidth(15.0),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "₹999\t\t",
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[700]),
                  ),
                  TextSpan(
                    text: "₹ ${product.price}",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2.0,
                        color: Colors.black54),
                  )
                ],
              ),
            ),
            FavouriteButton(
              product: product,
            )
          ],
        ),
        SizedBox(
          height: getProportionateScreenWidth(15),
        ),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20.0)),
          child: Text(
            product.description,
            // textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          ),
        ),
        SizedBox(
          height: getProportionateScreenWidth(20.0),
        )
      ],
    ),
  );
}
