import 'package:uuid/uuid.dart';
import '../models/Product.dart';

var uuid = Uuid();
List<Product> productsData = [
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      image: "assets/images/ps4_black.png",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Men's Regular T-Shirt",
      price: 3965,
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      image: "assets/images/tshirt.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Sports White Men's Pant",
      price: 4998,
      image: "assets/images/pant.png",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      image: "assets/images/ps4_black.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Men's Regular T-Shirt",
      price: 4998,
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      image: "assets/images/tshirt.png",
      special: false),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      price: 4998,
      image: "assets/images/ps4_black.png",
      special: false),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Sports White Men's Pant",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      price: 4998,
      image: "assets/images/pant.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      price: 4998,
      image: "assets/images/ps4_black.png",
      special: true),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Men's Regular T-Shirt",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      price: 4998,
      image: "assets/images/tshirt.png",
      special: false),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      price: 4998,
      image: "assets/images/ps4_black.png",
      special: false),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Sports White Men's Pant",
      description:
          "The feel, shape, and sensitivity of the dual analog sticks and trigger buttons have been improved to provide a greater sense of control, no matter what you play",
      price: 4998,
      image: "assets/images/pant.png",
      special: true)
];
