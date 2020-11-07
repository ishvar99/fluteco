import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/size_config.dart';
import '../../widgets/home/IconWithCounter.dart';
import '../../widgets/home/SearchBar.dart';
import '../../providers/Cart.dart';

AppBar header(BuildContext context) {
  final FirebaseFirestoreHelper helper = FirebaseFirestoreHelper();
  return AppBar(
    titleSpacing: getProportionateScreenWidth(10),
    toolbarHeight: getProportionateScreenWidth(130),
    title: Text(
      'Fluteco',
      style: TextStyle(fontWeight: FontWeight.w900),
    ),
    actions: [
      Icon(Icons.notifications),
      SizedBox(
        width: getProportionateScreenWidth(15),
      ),
      StreamBuilder<QuerySnapshot>(
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
            return IconWithCounter(
                count: snapshot.data.docs.length,
                press: () {
                  Navigator.pushNamed(context, '/cart');
                });
          }),
      SizedBox(
        width: getProportionateScreenWidth(20),
      ),
    ],
    bottom: PreferredSize(
        child: SearchBar(),
        preferredSize: Size.fromHeight(getProportionateScreenHeight(75))),
  );
}
