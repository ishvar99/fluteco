import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../providers/Product.dart';
import '../../resources/size_config.dart';
import '../../resources/constants.dart';
import '../../widgets/product/RatingCard.dart';
import '../../widgets/product/FavouriteButton.dart';
import 'package:intl/intl.dart';

Padding displayContent(BuildContext context, Product product) {
  final formatter =
      new NumberFormat.simpleCurrency(name: "INR", decimalDigits: 0);

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
            child: CachedNetworkImage(
              imageUrl: product.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: Colors.red),
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
                  fontSize: getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  color: kOfferBannerColor)),
        ),
        SizedBox(
          height: getProportionateScreenWidth(5.0),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: "${formatter.format(product.discountedPrice)}\t\t",
                    style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[600]),
                  ),
                  TextSpan(
                    text: "${formatter.format(product.originalPrice)}",
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.lineThrough,
                        decorationThickness: 2.0,
                        color: Colors.black54),
                  )
                ],
              ),
            ),
            FavouriteButton(),
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
