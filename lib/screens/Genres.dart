import 'package:flutter/material.dart';
import '../widgets/RecommendedCard.dart';
import '../data/genres.dart';
import '../resources/size_config.dart';

class Genres extends StatelessWidget {
  static const routeName = '/genres';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Genres"),
      ),
      body: Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(25.0)),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: getProportionateScreenWidth(2.4),
              mainAxisSpacing: getProportionateScreenWidth(25)),
          itemCount: genres.length,
          itemBuilder: (context, index) => Container(
            width: double.infinity,
            child: RecommendedCard(
              image: genres[index].genreImage,
              name: genres[index].genreName,
              availability: genres[index].genreAvailability,
            ),
          ),
        ),
      ),
    );
  }
}
