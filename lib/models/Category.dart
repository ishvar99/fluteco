import 'package:flutter/material.dart';

class Category {
  String id;
  String icon;
  String text;
  Category({@required this.icon, @required this.text, @required this.id});
  String get categoryId {
    return id;
  }

  String get categoryIcon {
    return icon;
  }

  String get categoryText {
    return text;
  }
}
