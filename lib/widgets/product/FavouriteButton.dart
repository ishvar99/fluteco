import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/FirebaseAuthHelper.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';
import 'package:flutter/material.dart';
import '../../resources/size_config.dart';
import '../../providers/Product.dart';
import 'package:provider/provider.dart';
import '../../components/home/showSnackbar.dart';

class FavouriteButton extends StatefulWidget {
  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return InkWell(
      onTap: () {
        FirebaseFirestoreHelper().addToWishlist(product.id);
        showSnackbar(context: context, favourite: true, productId: product.id);
      },
      splashColor: Colors.pink,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        bottomLeft: Radius.circular(20),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.pink[50],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(60),
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestoreHelper().isProductInWishlist().snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Icon(
                  Icons.favorite_border,
                  size: getProportionateScreenWidth(16),
                  color: Colors.pink[500],
                );
              }
              return Icon(
                  snapshot.data.data() != null &&
                          snapshot.data.data()['products'].contains(product.id)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.pink[500],
                  size: 22);
            }),
      ),
    );
  }
}
