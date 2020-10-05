import 'package:fluteco/data/special.dart';
import 'package:fluteco/widgets/RecommendedCard.dart';
import 'package:fluteco/widgets/SpecialCard.dart';
import 'package:flutter/material.dart';
import '../../data/recommended.dart';
import '../../data/categories.dart';
import '../../data/special.dart';
import '../../widgets/Category.dart';

SingleChildScrollView display({String type, BuildContext context}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        type == "recommended"
            ? recommended.length
            : type == "category" ? categories.length : special.length,
        (index) => type == "recommended"
            ? RecommendedCard(
                availability: recommended[index]['availability'],
                category: recommended[index]['category'],
                image: recommended[index]['image'],
              )
            : type == "category"
                ? Category(
                    icon: categories[index]['icon'],
                    text: categories[index]['text'],
                    tapped: () => Navigator.of(context).pushNamed(
                      '/${categories[index]['text'].toLowerCase()}',
                      arguments: {
                        'type': categories[index]['text'],
                      },
                    ),
                  )
                : type == "special"
                    ? SpecialCard(
                        title: special[index]['title'],
                        image: special[index]['image'],
                        price: special[index]['price'],
                      )
                    : null,
      ),
    ),
  );
}
