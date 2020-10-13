import '../resources/constants.dart';
import '../resources/size_config.dart';
import '../widgets/RatingCard.dart';
import 'package:flutter/material.dart';
import '../data/products.dart';
import '../models/Product.dart';
import '../widgets/FavouriteButton.dart';

class ProductScreen extends StatelessWidget {
  final String id;
  ProductScreen({@required this.id});
  @override
  Widget build(BuildContext context) {
    Product product = products.singleWhere((element) => element.id == id);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        height: getProportionateScreenWidth(60),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: InkWell(
                  child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF5F6F9),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(getProportionateScreenWidth(3.0), 0.0),
                        spreadRadius: 3.0,
                        blurRadius: 5.0),
                  ],
                ),
                child: Center(
                    child: Text(
                  'ADD TO CART',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              )),
            ),
            Expanded(
              child: InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: Offset(getProportionateScreenWidth(6.0), 0.0),
                          spreadRadius: 3.0,
                          blurRadius: 5.0),
                    ],
                    color: Colors.deepOrange,
                  ),
                  child: Center(
                    child: Text(
                      'BUY NOW',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(20)),
                child: RatingCard(
                  rating: 4,
                ),
              ),
              SizedBox(
                height: getProportionateScreenWidth(25.0),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(20.0)),
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
                  FavouriteButton()
                ],
              ),
              SizedBox(
                height: getProportionateScreenWidth(15),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: getProportionateScreenWidth(20.0)),
                child: Text(
                  product.description,
                  // textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
