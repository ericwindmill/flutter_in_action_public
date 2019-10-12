import 'dart:async';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/storage/mock_store.dart';

abstract class CartService {
  Stream<int> streamCartCount();

  Stream<Map<String, int>> streamCartItems();

  Future addToCart(Product p, int qty);

  Future<void> removeFromCart(String p, int qty);
}

/// Example implementation that *does not persist beyond the session*
class CartServiceTemporary implements CartService {
  final AppStore store;

  CartServiceTemporary(this.store);

  @override
  Future addToCart(Product p, int qty) async {
    var newTotalCount = store.cart.totalCartItems + qty;
    var newProductTotalCount = _currentCountForProduct(p) + qty;
    store.cart.totalCartItems = newTotalCount;
    store.cart.items[p.title] = newProductTotalCount;
    store.cart = store.cart; // used to fake reactivity
  }

  @override
  Future removeFromCart(String p, int qty) async {
    var newTotalCount = store.cart.totalCartItems - qty;
    store.cart.totalCartItems = newTotalCount;
    store.cart.items.remove(p);
    store.cart = store.cart; // used to fake reactivity
  }

  @override
  Stream<int> streamCartCount() {
    return store.cartNotifier.stream.map((snapshot) => store.cart.totalCartItems);
  }

  @override
  Stream<Map<String, int>> streamCartItems() {
    return store.cartNotifier.stream.map((dartData) => store.cart.items);
  }

  int _currentCountForProduct(Product p) {
    if (!store.cart.items.containsKey(p.title)) return 0;
    return store.cart.items[p.title];
  }
}
