import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/services/NetworkHelper.dart';

import '../providers/Cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/cart/CheckoutCard.dart';
import '../components/cart/body.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  final NetworkHelper helper = NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: helper.getCartProducts().snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Scaffold(
              appBar: AppBar(
                title: Text(
                  'Your Cart',
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              bottomNavigationBar:
                  snapshot.data.docs.length == 0 ? null : CheckoutCard(),
              body: snapshot.data.docs.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Your cart is empty!',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: getProportionateScreenWidth(20),
                          ),
                          FlatButton(
                            color: Colors.teal,
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(30),
                                vertical: getProportionateScreenWidth(10)),
                            child: Text('Shop now',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
                            onPressed: () {
                              Navigator.popAndPushNamed(context, '/home');
                            },
                          )
                        ],
                      ),
                    )
                  : displayCart(snapshot.data.docs));
        });
  }
}
