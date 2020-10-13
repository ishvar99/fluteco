import 'package:fluteco/data/products.dart';
import 'package:fluteco/widgets/home/RecommendedCard.dart';
import 'package:fluteco/widgets/home/SpecialCard.dart';
import 'package:flutter/material.dart';
import '../../data/genres.dart';
import '../../data/categories.dart';
import '../../data/products.dart';
import '../../widgets/miscellaneous/Category.dart';
import 'dart:math';
import '../../models/Genre.dart';

SingleChildScrollView display({String type, BuildContext context}) {
  int specialProductsLimit = 3;
  int recommendedGenresLimit = 3;
  List<Genre> randomGenres = [];
  final _random = new Random();
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
            type == "recommended-genres"
                ? recommendedGenresLimit
                : type == "categories"
                    ? categories.length
                    : specialProductsLimit, (index) {
          if (type == "recommended-genres") {
            genres.shuffle();
            Genre randomGenre = genres[_random.nextInt(genres.length)];
            while (randomGenres.contains(randomGenre)) {
              randomGenre = genres[_random.nextInt(genres.length)];
            }
            randomGenres.add(randomGenre);
            return RecommendedCard(
              availability: randomGenre.availability,
              name: randomGenre.name,
              image: randomGenre.image,
            );
          } else if (type == "categories") {
            return Category(
              icon: categories[index].categoryIcon,
              text: categories[index].categoryText,
              tapped: () => Navigator.of(context).pushNamed(
                '/categories',
                arguments: categories[index].categoryId,
              ),
            );
          } else if (type == "special-products") {
            if (products[index].special) {
              return SpecialCard(
                title: products[index].name,
                image: products[index].image,
                price: products[index].price,
                tapped: () => Navigator.pushNamed(
                  context,
                  '/products',
                  arguments: products[index].id,
                ),
              );
            } else
              return Container();
          } else
            return null;
        }),
      ));
}
