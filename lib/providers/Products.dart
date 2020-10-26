import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import './Product.dart';
import '../data/products.dart';

class Products with ChangeNotifier {
  List<Product> _products = [...productsData];

  List<Product> get products {
    return [..._products];
  }

  void addProduct({@required Map<String, dynamic> productData}) {
    _products.add(
      new Product(
        name: productData['name'],
        id: productData['id'],
        description: productData['description'],
        originalPrice: productData['originalPrice'],
        discountedPrice: productData['discountedPrice'],
        limit: productData['limit'],
        discount: productData['discount'],
        category: productData['category'],
        special: productData['special'],
        platformImage: productData['platformImage'],
        imageUrl: productData['imageUrl'],
      ),
    );
    notifyListeners();
  }

  void removeProduct(String id) {
    _products.removeWhere((element) => element.id == id);
    notifyListeners();
  }

  void updateProduct(
      {String id,
      String name,
      String description,
      int originalPrice,
      int discountedPrice,
      int discount,
      int limit,
      bool special,
      PlatformFile platformImage,
      String image,
      String category}) {
    _products.forEach((product) {
      if (product.id == id) {
        product.name = name;
        product.discount = discount;
        product.description = description;
        product.limit = limit;
        product.special = special;
        product.imageUrl = image;
        product.category = category;
        product.originalPrice = originalPrice;
        product.discountedPrice = discountedPrice;
        product.platformImage = platformImage;
      }
    });
    // Cart().removeItem(id);
    notifyListeners();
  }

  void forceUpdate() {
    notifyListeners();
  }
}
