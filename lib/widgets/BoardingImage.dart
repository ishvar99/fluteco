import '../resources/size_config.dart';
import 'package:flutter/material.dart';

class BoardingImage extends StatelessWidget {
  final String text;
  final String image;
  BoardingImage({@required this.text, @required this.image});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text(text)),
        SizedBox(
          height: 60,
        ),
        Container(
          width: getProportionateScreenWidth(300),
          height: getProportionateScreenHeight(300),
          child: Image.asset(image),
        ),
      ],
    );
  }
}
