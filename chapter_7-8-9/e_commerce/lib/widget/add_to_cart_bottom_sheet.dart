/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/blocs/app_state.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';

class AddToCartBottomSheet extends StatefulWidget {
  const AddToCartBottomSheet({Key key}) : super(key: key);

  @override
  _AddToCartBottomSheetState createState() => _AddToCartBottomSheetState();
}

class _AddToCartBottomSheetState extends State<AddToCartBottomSheet> {
  int _quantity = 0;
  AppState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    state = AppStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: MediaQuery.of(context).size.width,
        minHeight: MediaQuery.of(context).size.height / 2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(Spacing.matGridUnit()),
            child: Text(
              "Add item to Cart",
              style: Theme.of(context).primaryTextTheme.display1,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Spacing.matGridUnit(scale: 3)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                    iconSize: 40.0,
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      if (_quantity > 0) {
                        setState(() => _quantity--);
                      }
                    }),
                Text(
                  _quantity.toString(),
                  style: Theme.of(context).primaryTextTheme.headline,
                ),
                IconButton(
                  iconSize: 40.0,
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() => _quantity++);
                  },
                )
              ],
            ),
          ),
          RaisedButton(
            color: AppColors.primary[500],
            textColor: Colors.white,
            child: Text(
              "Add To Cart".toUpperCase(),
            ),
//            onPressed: () => state.updateCartTotal(_quantity)
            onPressed: () => Navigator.of(context).pop(_quantity),
          )
        ],
      ),
    );
  }
}
