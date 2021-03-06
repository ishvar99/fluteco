// import 'package:fluteco/data/limit.dart';
// import 'package:fluteco/services/NetworkHelper.dart';
// import 'package:flutter/material.dart';
// import './Product.dart';

// class Products with ChangeNotifier {
//   NetworkHelper helper = NetworkHelper();
//   Map<String, Map<String, Product>> _products = {};

//   Map<String, Map<String, Product>> get products {
//     return {..._products};
//   }

//   Future<void> fetchAllProducts() async {
//     try {
//       _products = await helper.getAllProducts(Map.from(_products));
//     } catch (error) {
//       print("Error: $error");
//     }
//     notifyListeners();
//   }

//   // Future<void> fetchHomeProducts() async {
//   //   try {
//   //     _products = await helper.getHomeProducts(Map.from(_products));
//   //   } catch (error) {
//   //     print("Error: $error");
//   //   }
//   //   notifyListeners();
//   // }

//   Future<void> fetchSpecialProducts() async {
//     try {
//       _products = await helper.getSpecialProducts(Map.from(_products));
//       print(_products);
//     } catch (error) {
//       print("Error: $error");
//     }
//     notifyListeners();
//   }

//   Future<void> fetchCategoryProducts(String category) async {
//     try {
//       _products =
//           await helper.getProductsByCategory(Map.from(_products), category);
//     } catch (error) {
//       print("Error: $error");
//     }
//     notifyListeners();
//   }

//   void addProduct({@required Map<String, dynamic> productData}) {
//     Product _product = Product(
//       id: productData['id'],
//       name: productData['name'],
//       description: productData['description'],
//       originalPrice: productData['originalPrice'],
//       discountedPrice: productData['discountedPrice'],
//       limit: productData['limit'],
//       discount: productData['discount'],
//       category: productData['category'],
//       imageName: productData['imageName'],
//       imageUrl: productData['imageUrl'],
//     );
//     if (productData['discount'] >= thresholdDiscount)
//       _products['special'].putIfAbsent(productData['id'], () => _product);
//     else
//       _products[productData['category']]
//           .putIfAbsent(productData['id'], () => _product);
//     notifyListeners();
//   }

//   // void removeProduct(String id) {
//   //   _products.removeWhere((element) => element.id == id);
//   //   notifyListeners();
//   // }

//   void updateProduct({@required Map<String, dynamic> productData}) {
//     // Cart().removeItem(id);
//     notifyListeners();
//   }
// }
