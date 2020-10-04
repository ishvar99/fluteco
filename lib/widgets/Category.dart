import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String icon;
  final String text;
  Category({@required this.icon, @required this.text});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(7)),
      child: SizedBox(
          width: getProportionateScreenWidth(55),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: EdgeInsets.all(
                    getProportionateScreenWidth(15),
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.deepOrange, width: 0.1),
                    color: Color(0xFFFFECDF),
                    // color: Colors.deepOrange[50],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset(icon),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                    fontSize: getProportionateScreenWidth(10),
                    fontWeight: FontWeight.bold),
              )
            ],
          )),
    );
  }
}
