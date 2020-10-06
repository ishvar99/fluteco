import 'package:fluteco/data/products.dart';
import 'package:fluteco/widgets/RecommendedCard.dart';
import 'package:fluteco/widgets/SpecialCard.dart';
import 'package:flutter/material.dart';
import '../../data/recommended.dart';
import '../../data/categories.dart';
import '../../data/products.dart';
import '../../widgets/Category.dart';

SingleChildScrollView display({String type, BuildContext context}) {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(
        type == "recommended-genres"
            ? recommended.length
            : type == "categories" ? categories.length : products.length,
        (index) => type == "recommended-genres"
            ? RecommendedCard(
                availability: recommended[index]['availability'],
                category: recommended[index]['category'],
                image: recommended[index]['image'],
              )
            : type == "categories"
                ? Category(
                    icon: categories[index].categoryIcon,
                    text: categories[index].categoryText,
                    tapped: () => Navigator.of(context).pushNamed(
                      '/categories',
                      arguments: categories[index].categoryId,
                    ),
                  )
                : type == "special-products"
                    ? (products[index].special
                        ? SpecialCard(
                            title: products[index].name,
                            image: products[index].image,
                            price: products[index].price,
                            tapped: () => Navigator.pushNamed(
                              context,
                              '/products',
                              arguments: products[index].id,
                            ),
                          )
                        : Container())
                    : null,
      ),
    ),
  );
}
