import 'package:flutter/material.dart';
import '../../widgets/PartitionHeader.dart';
import '../../widgets/BannerCarousel.dart';
import './categories.dart';
import '../../widgets/SpecialCard.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannerCarousel(),
        displayCategories(),
        PartitionHeader(
          type: "Recommended for you",
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialCard(
                category: "Smartphones",
                numOfCount: 18,
                image: "assets/images/Image Banner 2.png",
              ),
              SpecialCard(
                category: "Fashion",
                numOfCount: 30,
                image: "assets/images/Image Banner 3.png",
              ),
              SpecialCard(
                category: "Smartphones",
                numOfCount: 18,
                image: "assets/images/Image Banner 2.png",
              ),
              SpecialCard(
                category: "Fashion",
                numOfCount: 30,
                image: "assets/images/Image Banner 3.png",
              )
            ],
          ),
        ),
        PartitionHeader(
          type: "Fluteco's Special",
        )
      ],
    );
  }
}
