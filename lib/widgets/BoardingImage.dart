import '../resources/size_config.dart';
import 'package:flutter/material.dart';

class BoardingImage extends StatelessWidget {
  final String text;
  final String image;
  BoardingImage({this.text, this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text),
        SizedBox(
          height: 60,
        ),
        Container(
          width: getProportionateScreenWidth(300),
          child: Image.asset(image),
        ),
      ],
    );
  }
}
