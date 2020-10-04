import 'package:fluteco/resources/size_config.dart';
import 'package:flutter/material.dart';

class SpecialCard extends StatelessWidget {
  final String image;
  SpecialCard({@required this.image});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(15)),
      child: SizedBox(
        width: getProportionateScreenWidth(240),
        height: getProportionateScreenHeight(130),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(children: [
            Image.asset(
              image,
              fit: BoxFit.cover,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF343434).withOpacity(0.5),
                    Color(0xFF343434).withOpacity(0.25)
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
