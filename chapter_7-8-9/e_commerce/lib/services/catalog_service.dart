import 'dart:async';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/storage/mock_store.dart';

abstract class CatalogService {
  Stream<List<Product>> streamProducts();
  Stream<List<Product>> streamProductCategory(ProductCategory category);
  Future<void> addNewProduct(Product product);
  Future<void> updateProduct(Product product);
}

/// Example implementation that *does not persist beyond the session*
class CatalogServiceTemporary implements CatalogService {
  final AppStore store;

  CatalogServiceTemporary(this.store);

  @override
  Future addNewProduct(Product product) async {
    store.catalog.availableProducts.add(product);
  }

  @override
  Stream<List<Product>> streamProductCategory(ProductCategory category) {
    return store.catalogNotifier.stream.map((snapshot) =>
        store.catalog.availableProducts.where((Product p) => p.category == category).toList());
  }

  @override
  Stream<List<Product>> streamProducts() {
    return store.catalogNotifier.stream.map((snapshot) {
      return store.catalog.availableProducts;
    });
  }

  @override
  Future updateProduct(Product product) async {
    var orinalProduct =
        store.catalog.availableProducts.firstWhere((Product p) => p.title == product.title);
    store.catalog.availableProducts.remove(orinalProduct);
    store.catalog.availableProducts.add(product);
  }
}
