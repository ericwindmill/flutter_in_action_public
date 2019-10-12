import 'dart:math' as math;

import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/utils/product_seeds.dart';
import 'package:e_commerce/models/catalog.dart';

/// Search through the [categorizeProducts] Map and find the category
/// who's value list contains this product.
/// Not efficient, but fine considering the small dataset.
ProductCategory getCategoryForProduct(String productName) => categorizeProducts.entries
    .firstWhere(
        (MapEntry<ProductCategory, List<String>> entry) => entry.value.contains(productName))
    .key;

/// Generate random cost for product roughly between 1 and 3 USD.
var _random = math.Random();

double determineCost() {
  var cost = (_random.nextDouble() * 3.3).clamp(0.7, 3.3).toStringAsFixed(2);
  return double.parse(cost);
}

Product createProduct(String productName) {
  return Product(
      title: productName,
      imageTitle: availableProductsToImage[productName],
      category: getCategoryForProduct(productName),
      cost: determineCost());
}

Catalog populateCatalog() {
  var catalog = Catalog();

  availableProductsToImage.forEach((String productName, ImageTitle imageTitle) {
    catalog.availableProducts.add(createProduct(productName));
  });

  return catalog;
}

Cart buildInitialCart() {
  return Cart()
    ..items = {}
    ..totalCartItems = 0
    ..totalCost = 0.00;
}
