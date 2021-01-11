import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluteco/services/FirebaseFirestoreHelper.dart';

import '../providers/Product.dart';

Future<Product> populateProductById(String productId) async {
  DocumentSnapshot doc =
      await FirebaseFirestoreHelper().getProduct(productId).get();
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
  );
}
