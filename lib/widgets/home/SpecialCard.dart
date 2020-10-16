import '../../providers/Product.dart';
import '../../resources/constants.dart';
import '../../resources/size_config.dart';
import 'package:flutter/material.dart';
import './ImageCard.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SpecialCard extends StatefulWidget {
  @override
  _SpecialCardState createState() => _SpecialCardState();
}

class _SpecialCardState extends State<SpecialCard> {
  final formatter =
      new NumberFormat.simpleCurrency(locale: "en_IN", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: SizedBox(
        width: getProportionateScreenWidth(160),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageCard(
                tapped: () => Navigator.pushNamed(
                      context,
                      '/products',
                      arguments: product.id,
                    ),
                image: product.image),
            const SizedBox(height: 5),
            Text(
              product.name,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            Row(children: [
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(7)),
                child: Text(
                  "${formatter.format(product.price)}",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 2.0,
                      fontSize: getProportionateScreenWidth(18),
                      fontWeight: FontWeight.w600,
                      color: kPrimaryColor),
                ),
              ),
              Text(
                "${formatter.format(999)}",
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(18),
                    fontWeight: FontWeight.w600,
                    color: kOfferBannerColor),
              ),
              Spacer(),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                splashColor: Colors.pink[50],
                onTap: () {
                  product.toggleFavouriteStatus();
                },
                child: Icon(
                  product.favourite ? Icons.favorite : Icons.favorite_border,
                  size: getProportionateScreenWidth(20),
                  color: Colors.pink[500],
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
