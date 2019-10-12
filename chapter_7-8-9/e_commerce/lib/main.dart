/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/app.dart';
import 'package:e_commerce/blocs/app_state.dart';
import 'package:e_commerce/blocs/cart_bloc.dart';
import 'package:e_commerce/blocs/catalog_bloc.dart';
import 'package:e_commerce/blocs/user_bloc.dart';
import 'package:e_commerce/services/cart_service.dart';
import 'package:e_commerce/services/catalog_service.dart';
import 'package:e_commerce/services/user_service.dart';
import 'package:e_commerce/storage/mock_store.dart';
import 'package:flutter/material.dart';

/// In this app, we initialize the Firestore, AppBloc, and ServiceProvider
/// right from the start, then inject them into the app.
Future<void> main() async {
  var store = AppStore();
  var catalogService = CatalogServiceTemporary(store);
  var cartService = CartServiceTemporary(store);
  var userService = MockUserService(store);

  /// Starting here, everything is used regardless of dependencies
  var blocProvider = BlocProvider(
    cartBloc: CartBloc(cartService),
    catalogBloc: CatalogBloc(catalogService),
    userBloc: UserBloc(userService),
  );

  /// Wrap the app in the AppBloc
  /// An inherited widget which keeps track of
  /// the state of the app, including the
  /// active page
  runApp(
    AppStateContainer(
      blocProvider: blocProvider,
      child:  ECommerceApp(),
    ),
  );
}
