import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/data/limit.dart';
import 'package:fluteco/providers/Product.dart';
import 'package:fluteco/resources/size_config.dart';
import 'package:fluteco/utility/transformQuerySnapshot.dart';
import 'package:fluteco/widgets/home/RecommendedCard.dart';
import 'package:fluteco/widgets/home/SpecialCard.dart';
import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../data/genres.dart';
import '../../data/categories.dart';
import '../../widgets/miscellaneous/Category.dart';
import '../../providers/Products.dart';
import '../../models/Genre.dart';

SingleChildScrollView display(
    {String type,
    BuildContext context,
    List<QueryDocumentSnapshot> documents}) {
  // int specialProductsLimit = 3;
  int recommendedGenresLimit = 3;
  List<Genre> randomGenres = [];
  final _random = new Random();
  return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: EdgeInsets.only(
          right: getProportionateScreenWidth(5),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              type == "recommended-genres"
                  ? recommendedGenresLimit
                  : type == "categories"
                      ? categories.length
                      : documents.length > flutecoSpecialHome
                          ? flutecoSpecialHome
                          : documents.length, (index) {
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
                icon: categories[index].icon,
                text: categories[index].text,
                tapped: () => Navigator.of(context).pushNamed(
                  '/categories',
                  arguments: categories[index].text,
                ),
              );
            } else if (type == "special-products") {
              return ChangeNotifierProvider.value(
                value: transformQuerySnapshot(
                  documents[index],
                ),
                child: SpecialCard(),
              );
            } else
              return null;
          }),
        ),
      ));
}
