/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'dart:async';

import 'package:e_commerce/models/events/add_product.dart';
import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/services/catalog_service.dart';
import 'package:e_commerce/utils/generate_cart_data.dart';
import 'package:rxdart/rxdart.dart';

class CatalogBloc {
  final CatalogService _service;

  // Output products
  StreamController _productStreamController =
      BehaviorSubject<List<Product>>(seedValue: populateCatalog().availableProducts);
  Stream<List<Product>> get allProducts => _productStreamController.stream;

  List<StreamController<List<Product>>> _controllersByCategory = [];
  List<Stream<List<Product>>> productStreamsByCategory = [];

  // Inputs
  final _productInputController = StreamController<ProductEvent>.broadcast();

  Sink<ProductEvent> get addNewProduct => _productInputController.sink;

  Sink<ProductEvent> get updateProduct => _productInputController.sink;

  CatalogBloc(this._service) {
    _productInputController.stream
        .where((ProductEvent event) => event is UpdateProductEvent)
        .listen(_handleProductUpdate);
    _productInputController.stream
        .where((ProductEvent event) => event is AddProductEvent)
        .listen(_handleAddProduct);
    _service.streamProducts().listen((List<Product> data) {
      _productStreamController.add(data);
    });

    /// Category Streams
    /// create a  stream controller and stream for each category
    ProductCategory.values.forEach((ProductCategory category) {
      var _controller = BehaviorSubject<List<Product>>();
      _service.streamProductCategory(category).listen((List<Product> data) {
        return _controller.add(data);
      });
      return _controllersByCategory.add(_controller);
    });

    _controllersByCategory.forEach((StreamController<List<Product>> controller) {
      productStreamsByCategory.add(controller.stream);
    });
  }

  _handleProductUpdate(ProductEvent event) {
    _service.addNewProduct(
      Product(
        title: event.product.title,
        category: event.product.category,
        cost: event.product.cost,
        imageTitle: ImageTitle.SlicedOranges, // This is faked.
      ),
    );
  }

  _handleAddProduct(ProductEvent event) {
    _service.addNewProduct(
      Product(
        category: event.product.category,
        title: event.product.title,
        cost: event.product.cost,
        imageTitle: ImageTitle.SlicedOranges,
      ),
    );
  }

  void close() {
    _productStreamController.close();
    _productInputController.close();
    _controllersByCategory.forEach((controller) => controller.close());
  }
}
