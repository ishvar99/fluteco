import 'package:cloud_firestore/cloud_firestore.dart';

import '../providers/Product.dart';

Product transformQuerySnapshot(dynamic doc) {
  return Product(
      id: doc.id,
      name: doc.data()['name'],
      originalPrice: doc.data()['originalPrice'],
      discount: doc.data()['discount'],
      discountedPrice: doc.data()['discountedPrice'],
      imageUrl: doc.data()['imageUrl'],
      imageName: doc.data()['imageName'],
      limit: doc.data()['limit'],
      category: doc.data()['category'],
      description: doc.data()['description'],
      favourite: doc.data()['favourite']);
}
