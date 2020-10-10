import 'package:fluteco/resources/constants.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/Product.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  ProductScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Product product = products.singleWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Icon(Icons.card_travel),
          SizedBox(
            width: getProportionateScreenWidth(10),
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(25.0)),
          child: Container(
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    product.image,
                    height: getProportionateScreenWidth(250),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(30.0),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: "${product.name}\n\n",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(24),
                                fontWeight: FontWeight.bold,
                                color: kOfferBannerColor)),
                        TextSpan(
                          text: product.description,
                          style: TextStyle(fontSize: 16),
                        )
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
