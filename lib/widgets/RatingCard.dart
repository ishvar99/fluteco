import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class RatingCard extends StatelessWidget {
  final int rating;
  RatingCard({@required this.rating});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenWidth(50),
      width: getProportionateScreenWidth(50),
      child: Row(children: [
        Text("$rating"),
        Icon(
          Icons.star,
          color: Colors.yellow,
        ),
      ]),
    );
  }
}
