/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/page/base/page_base.dart';
import 'package:e_commerce/page/base/page_container.dart';
import 'package:e_commerce/utils/e_commerce_routes.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final RouteObserver<Route> routeObserver = RouteObserver<Route>();

class ECommerceApp extends StatefulWidget {
  @override
  _ECommerceAppState createState() => _ECommerceAppState();
}

class _ECommerceAppState extends State<ECommerceApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

    /// All constants can be found in [utils/styles.dart]
    var _theme = ThemeData(
      // content
      backgroundColor: AppColors.background,
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.textColor,
            displayColor: AppColors.textColor,
          ),
      // headings -- contrasts 'primary color'
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.displayTextColor,
            displayColor: AppColors.displayTextColor,
          ),
      // ui -- contrasts 'accent color'
      accentTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColors.accentTextColor,
            displayColor: AppColors.accentTextColor,
          ),
      primaryColor: AppColors.primary,
      accentColor: AppColors.accent,
      primaryIconTheme: Theme.of(context)
          .iconTheme
          .copyWith(color: AppColors.displayTextColor),
      buttonColor: Colors.black54,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      routes: {
        ECommerceRoutes.catalogPage: (context) =>
            PageContainer(pageType: PageType.Catalog),
        ECommerceRoutes.cartPage: (context) =>
            PageContainer(pageType: PageType.Cart),
        ECommerceRoutes.userSettingsPage: (context) =>
            PageContainer(pageType: PageType.Settings),
        ECommerceRoutes.addProductFormPage: (context) =>
            PageContainer(pageType: PageType.AddProductForm),
      },
      navigatorObservers: [routeObserver],
    );
  }
}
