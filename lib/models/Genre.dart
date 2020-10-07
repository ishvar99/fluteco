import 'package:flutter/material.dart';

class Genre {
  String name;
  int availability;
  String image;
  Genre(
      {@required this.name, @required this.availability, @required this.image});

  String get genreName {
    return name;
  }

  String get genreImage {
    return image;
  }

  int get genreAvailability {
    return availability;
  }
}
