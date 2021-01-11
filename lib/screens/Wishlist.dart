import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';
import 'package:fluteco/utility/transformProductsMap.dart';
import 'package:fluteco/utility/transformQuerySnapshot.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../resources/size_config.dart';
import '../widgets/home/SpecialCard.dart';

class Wishlist extends StatefulWidget {
  static const routeName = '/wishlist';
  @override
  _WishlistState createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestoreHelper().fetchWishlist().snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('Something went wrong'));
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Padding(
              padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(15),
                  right: getProportionateScreenWidth(15),
                  top: getProportionateScreenWidth(30)),
              child: snapshot.data.data() == null ||
                      snapshot.data.data()['products'].length == 0
                  ? Center(
                      child: Text(
                        "You haven't added any products yet",
                        style: TextStyle(fontSize: 14),
                      ),
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getProportionateScreenWidth(2).round(),
                        childAspectRatio: getProportionateScreenWidth(0.7),
                        crossAxisSpacing: 2,
                      ),
                      itemCount: snapshot.data.data()['products'].length,
                      itemBuilder: (context, index) =>
                          ChangeNotifierProvider.value(
                            value: transformQuerySnapshot(
                                snapshot.data.data()['products'][index]),
                            child: SpecialCard(
                              wishListItem: true,
                            ),
                          )),
            );
          }),
      appBar: AppBar(
        title: Text(
          "Wishlist",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
