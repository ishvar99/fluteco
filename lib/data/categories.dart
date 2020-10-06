import '../models/Category.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();
List<Category> categories = [
  Category(id: uuid.v1(), icon: "assets/icons/jewel.png", text: "Jewels"),
  Category(id: uuid.v1(), icon: "assets/icons/clothes.png", text: "Fashion"),
  Category(
      id: uuid.v1(), icon: "assets/icons/kitchenwares.png", text: "Kitchen"),
  Category(
      id: uuid.v1(), icon: "assets/icons/stationary.png", text: "Stationary"),
  Category(id: uuid.v1(), icon: "assets/icons/food.png", text: "Eatables"),
  Category(
      id: uuid.v1(), icon: "assets/icons/confectionary.png", text: "Groceries"),
  Category(id: uuid.v1(), icon: "assets/icons/home_decor.png", text: "Home"),
  Category(
      id: uuid.v1(), icon: "assets/icons/electronics.png", text: "Electronics")
];
