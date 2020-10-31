import '../providers/Product.dart';

List<Product> transformProducts(Map<String, Map<String, Product>> products) {
  return products.values
      .toList()
      .map((e) => e.values.toList())
      .expand((e) => e)
      .toList();
}
