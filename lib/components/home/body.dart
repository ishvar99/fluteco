import 'package:flutter/material.dart';
import '../../widgets/home/PartitionHeader.dart';
import '../../widgets/home/BannerCarousel.dart';
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
          child: display(type: "categories", context: context),
        ),
        PartitionHeader(
          type: "Recommended for you",
        ),
        display(type: "recommended-genres", context: context),
        PartitionHeader(
          type: "Fluteco's Special",
        ),
        display(type: "recommended-genres", context: context),
        PartitionHeader(
          type: "Fluteco's Special",
        ),
        display(type: "recommended-genres", context: context),
        PartitionHeader(
          type: "Fluteco's Special",
        ),
        display(type: "special-products", context: context),
        SizedBox(
          height: 25,
        )
      ],
    );
  }
}
