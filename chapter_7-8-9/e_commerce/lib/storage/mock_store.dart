/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:e_commerce/models/cart.dart';
import 'package:e_commerce/models/catalog.dart';
import 'package:e_commerce/models/user.dart';
import 'package:e_commerce/utils/generate_cart_data.dart';

/// Mocks a reactive database service, like Firestore:
/// updates a datasource that *isn't* persistent,
/// then notifies listeners.
class AppStore {
  Cart _cart;
  Catalog _catalog;
  ECommerceUser _user;

  StreamController<Cart> cartNotifier = StreamController<Cart>.broadcast();
  StreamController<Catalog> catalogNotifier = StreamController<Catalog>.broadcast();
  StreamController<ECommerceUser> userNotifier = StreamController<ECommerceUser>.broadcast();

  AppStore() {
    // initialize app fake data
    _cart = buildInitialCart();
    _catalog = populateCatalog();
    _user = ECommerceUser(name: "Eric Windmill", contact: "eric@ericwindmill.com", userProducts: []);
    // emit initial events, notifying the UI
    Future.delayed(Duration(milliseconds: 500), () {
      catalogNotifier.add(_catalog);
      cartNotifier.add(_cart);
      userNotifier.add(_user);
    });
  }

  Cart get cart => _cart;

  set cart(Cart c) {
    _cart = c;
    cartNotifier.add(c);
  }

  Catalog get catalog => _catalog;

  set catalog(Catalog c) {
    _catalog = c;
    catalogNotifier.add(c);
  }

  ECommerceUser get user => _user;

  set user(ECommerceUser c) {
    _user = c;
    userNotifier.add(c);
  }
}
