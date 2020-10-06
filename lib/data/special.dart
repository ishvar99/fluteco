import 'package:uuid/uuid.dart';
import '../model/Product.dart';

var uuid = Uuid();
List<Product> special = [
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      image: "assets/images/popular_product.png"),
  Product(
      id: "${uuid.v1()}",
      name: "Nike Sport White- Man Pant",
      price: 3965,
      image: "assets/images/popular_product2.png"),
  Product(
      id: "${uuid.v1()}",
      name: "Wireless Controller for PS4",
      price: 4998,
      image: "assets/images/popular_product.png")
];
