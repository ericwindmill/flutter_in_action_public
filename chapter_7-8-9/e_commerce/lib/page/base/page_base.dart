/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/widget/appbar_cart_icon.dart';
import 'package:flutter/material.dart';

enum PageType { Catalog, Cart, Settings, ProductDetail, AddProductForm }

abstract class PageContainerBase extends StatelessWidget {
  Widget get body;

  String get pageTitle;

  Widget get menuDrawer;

  Widget get background;

  Color get backgroundColor;

  const PageContainerBase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).backgroundColor,
        ),
        background,
        Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            title: Text(pageTitle),
            textTheme: Theme.of(context).primaryTextTheme,
            actions: <Widget>[
              AppBarCartIcon(),
            ],
          ),
          drawer: menuDrawer,
          body: body,
        ),
      ],
    );
  }
}
