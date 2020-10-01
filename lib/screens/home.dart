import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fluteco',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        actions: [
          Icon(Icons.shopping_cart),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.notifications),
          SizedBox(
            width: 15,
          )
        ],
        bottom: PreferredSize(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                height: getProportionateScreenHeight(60),
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: getProportionateScreenWidth(10),
                          horizontal: getProportionateScreenWidth(20))),
                ),
              ),
            ),
            preferredSize: Size.fromHeight(getProportionateScreenHeight(80))),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15.0),
              ),
              height: getProportionateScreenHeight(120),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Mega Offer',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: getProportionateScreenHeight(15))),
                      Text(
                        'Flat 25% Cashback',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: getProportionateScreenHeight(30),
                            fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
              )),
        ),
        SizedBox(
          height: 20,
        ),
        Row(children: [
          
        ],
      ]),
    );
  }
}
