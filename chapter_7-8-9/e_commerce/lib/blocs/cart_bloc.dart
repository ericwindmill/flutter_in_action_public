/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc {
  final CartService _service;

  // Inputs
  StreamController<AddToCartEvent> addProductSink = StreamController<AddToCartEvent>();
  StreamController<RemoveFromCartEvent> removeFromCartSink =
      StreamController<RemoveFromCartEvent>();

  // Outputs
  Stream<Map<String, int>> get cartItems => _cartItemStreamController.stream;
  StreamController _cartItemStreamController = BehaviorSubject<Map<String, int>>(seedValue: {});

  Stream<int> get cartItemCount => _cartItemCountStreamController.stream;
  StreamController _cartItemCountStreamController = BehaviorSubject<int>(seedValue: 0);

  CartBloc(this._service) {
    // Listen to inputs
    addProductSink.stream.listen((_handleAddItemsToCart));
    removeFromCartSink.stream.listen((_handleRemoveCartItem));

    // listen for incoming outputs
    _service.streamCartCount().listen((int count) {
      _cartItemCountStreamController.add(count);
    });
    _service
        .streamCartItems()
        .listen((Map<String, int> data) => _cartItemStreamController.add(data));
  }

  void _handleAddItemsToCart(AddToCartEvent e) {
    _service.addToCart(e.product, e.qty);
  }

  void _handleRemoveCartItem(RemoveFromCartEvent e) {
    _service.removeFromCart(e.productTitle, e.qtyInCart);
  }

  close() {
    addProductSink.close();
    removeFromCartSink.close();
    _cartItemStreamController.close();
    _cartItemCountStreamController.close();
  }
}

class AddToCartEvent {
  final Product product;
  final int qty;

  AddToCartEvent(this.product, this.qty);
}

class RemoveFromCartEvent {
  final String productTitle;
  final int qtyInCart;

  RemoveFromCartEvent(this.productTitle, this.qtyInCart);
}
