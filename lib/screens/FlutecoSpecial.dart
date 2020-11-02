import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/services/NetworkHelper.dart';
import 'package:fluteco/utility/transformQuerySnapshot.dart';
import 'package:fluteco/widgets/home/SpecialCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlutecoSpecial extends StatefulWidget {
  static const routeName = '/special-products';

  @override
  _FlutecoSpecialState createState() => _FlutecoSpecialState();
}

class _FlutecoSpecialState extends State<FlutecoSpecial> {
  final NetworkHelper _helper = NetworkHelper();
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await _helper.getSpecialProducts().get();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Fluteco's Special",
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _helper.getSpecialProducts().snapshots(),
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
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    // CategoriesList(),
                    SizedBox(
                      height: getProportionateScreenWidth(25),
                    ),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              getProportionateScreenWidth(2).round(),
                          childAspectRatio: getProportionateScreenWidth(0.63),
                          crossAxisSpacing: 2,
                        ),
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context, index) {
                          return ChangeNotifierProvider.value(
                              value: transformQuerySnapshot(
                                  snapshot.data.docs[index]),
                              child: SpecialCard());
                        },
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
