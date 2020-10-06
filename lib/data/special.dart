import 'package:uuid/uuid.dart';

var uuid = Uuid();
List<Map<String, dynamic>> special = [
  {
    "id": "${uuid.v1()}",
    "title": "Wireless Controller for PS4",
    "price": 4998,
    "image": "assets/images/popular_product.png"
  },
  {
    "id": "${uuid.v1()}",
    "title": "Nike Sport White- Man Pant",
    "price": 3965,
    "image": "assets/images/popular_product2.png"
  },
  {
    "id": "${uuid.v1()}",
    "title": "Wireless Controller for PS4",
    "price": 4998,
    "image": "assets/images/popular_product.png"
  }
];
