import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';
import '../../widgets/home/PartitionHeader.dart';
import '../../widgets/home/BannerCarousel.dart';
import '../../resources/size_config.dart';
import './display.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  NetworkHelper _helper = NetworkHelper();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerCarousel(),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: display(
            type: "categories",
            context: context,
          ),
        ),
        PartitionHeader(
          type: "Recommended for you",
        ),
        display(type: "recommended-genres", context: context),
        PartitionHeader(
          type: "Fluteco's Special",
        ),
        StreamBuilder<QuerySnapshot>(
            stream: _helper.getSpecialProducts().snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                //something went wrong
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: getProportionateScreenWidth(30),
                  width: getProportionateScreenWidth(30),
                  child: Center(
                      child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.deepOrange,
                    ),
                  )),
                );
              }
              return display(
                type: "special-products",
                context: context,
                documents: snapshot.data.docs,
              );
            }),
        SizedBox(
          height: 25,
        )
      ],
    );
  }

  // @override
  // void dispose() {
  //   _connectivity.disposeStream();
  //   super.dispose();
  // }
}
