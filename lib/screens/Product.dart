import '../resources/constants.dart';
import '../resources/size_config.dart';
import '../widgets/RatingCard.dart';
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
        title: Text("Fluteco", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
      ),
      bottomNavigationBar: SizedBox(
        height: getProportionateScreenWidth(50),
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
          padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenWidth(25.0),
              horizontal: getProportionateScreenWidth(25.0)),
          child: Container(
            width: double.infinity,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    product.image,
                    height: getProportionateScreenWidth(200),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10.0),
                  ),
                  Text("${product.name}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: getProportionateScreenWidth(24),
                          fontWeight: FontWeight.bold,
                          color: kOfferBannerColor)),
                  SizedBox(
                    height: getProportionateScreenWidth(5.0),
                  ),
                  Text(
                    "₹ ${product.price}",
                    style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal[800]),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10.0),
                  ),
                  RatingCard(
                    rating: 4,
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(10.0),
                  ),
                  Text(
                    product.description,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: getProportionateScreenWidth(20.0),
                  ),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.teal, shape: BoxShape.circle),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: Text(
                            "1",
                            style: TextStyle(
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              color: Colors.teal, shape: BoxShape.circle),
                          child: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
