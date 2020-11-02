import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:flutter/material.dart';
import '../../widgets/home/PartitionHeader.dart';
import '../../widgets/home/BannerCarousel.dart';
import '../../resources/size_config.dart';
import './display.dart';
import 'package:connectivity/connectivity.dart';
// import '../../utility/connectivity.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  NetworkHelper _helper = NetworkHelper();
  // Map _source = {ConnectivityResult.none: false};
  // MyConnectivity _connectivity = MyConnectivity.instance;

  @override
  void initState() {
    super.initState();
    // _connectivity.initialise();
    // _connectivity.myStream.listen((source) {
    //   setState(() => _source = source);
    // });
  }

  @override
  Widget build(BuildContext context) {
    // final snackBar = SnackBar(
    //   content: Text("No Internet Connection"),
    //   behavior: SnackBarBehavior.floating,
    //   duration: Duration(
    //     days: 365,
    //   ),
    // );
    // switch (_source.keys.toList()[0]) {
    //   case ConnectivityResult.none:
    //     {
    //       print('disconnected');
    //       Scaffold.of(context).showSnackBar(snackBar);
    //       break;
    //     }
    //   case ConnectivityResult.mobile:
    //   case ConnectivityResult.wifi:
    //     {
    //       print('connected');
    //       Scaffold.of(context).removeCurrentSnackBar();
    //       break;
    //     }
    // }

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
