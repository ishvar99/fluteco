int computeDiscount(int originalPrice, int discount) {
  int discountedPrice;
  if (discount == 0) {
    discountedPrice = originalPrice;
  } else {
    discountedPrice =
        (originalPrice - (discount / 100 * originalPrice)).round();
  }
  return discountedPrice;
}
