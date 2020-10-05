import 'package:flutter/material.dart';
import '../../widgets/PartitionHeader.dart';
import '../../widgets/BannerCarousel.dart';
import '../../resources/size_config.dart';
import './display.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerCarousel(),
        Padding(
          padding:
              EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
          child: display(type: "category", context: context),
        ),
        PartitionHeader(
          type: "Recommended for you",
        ),
        display(type: "recommended"),
        PartitionHeader(
          type: "Fluteco's Special",
        ),
        display(type: "special"),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
