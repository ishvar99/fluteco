import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final Image icon;
  final String text;
  Category({@required this.icon, @required this.text});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: icon,
              ),
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: getProportionateScreenWidth(10),
                  fontWeight: FontWeight.bold),
            )
          ],
        ));
  }
}
