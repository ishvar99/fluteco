import 'package:flutter/material.dart';
import '../../widgets/Category.dart';
import '../../resources/size_config.dart';
import '../../data/categories.dart';

Padding displayCategories() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: getProportionateScreenWidth(5)),
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
            categories.length,
            (index) => Category(
              icon: categories[index]['icon'],
              text: categories[index]['text'],
            ),
          ),
        ),
      ),
    ),
  );
}
