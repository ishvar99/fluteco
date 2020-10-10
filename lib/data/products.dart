import 'package:uuid/uuid.dart';
import '../models/Product.dart';

var uuid = Uuid();
List<Product> products = [
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      image: "assets/images/ps4_black.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Men's Regular T-Shirt",
      price: 3965,
      image: "assets/images/tshirt.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Sports White Men's Pant",
      price: 4998,
      image: "assets/images/pant.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      image: "assets/images/ps4_black.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Men's Regular T-Shirt",
      price: 4998,
      image: "assets/images/tshirt.png",
      special: false),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      image: "assets/images/ps4_black.png",
      special: false),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Sports White Men's Pant",
      price: 4998,
      image: "assets/images/pant.png",
      special: true)
];
