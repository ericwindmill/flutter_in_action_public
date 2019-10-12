/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/blocs/app_state.dart';
import 'package:e_commerce/blocs/cart_bloc.dart';
import 'package:e_commerce/utils/styles.dart';
import 'package:e_commerce/widget/scrollables/sliver_header.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _bloc = AppStateContainer.of(context).blocProvider.cartBloc;
    return CustomScrollView(
      slivers: <Widget>[
        CustomSliverHeader(
          headerText: "Cart Items",
        ),
        StreamBuilder(
          stream: _bloc.cartItems,
          initialData: <String, int>{},
          builder: (BuildContext context, AsyncSnapshot<Map<String, int>> snapshot) {
            if (snapshot.data.keys.isEmpty) {
              return SliverFillRemaining(child: Text("Your cart is empty"));
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  var _product = snapshot.data.keys.toList()[index];
                  var qty = snapshot.data[_product];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: .5, color: Colors.black54),
                      ),
                    ),
                    child: Dismissible(
                      direction: DismissDirection.endToStart,
                      background: Container(color: Colors.red[300]),
                      key: Key(_product),
                      child: Container(
                        child: ListTile(
                          title: Text(_product),
                          subtitle: Text('Qty in cart: $qty'),
                          trailing: Text("5.00"),
                        ),
                      ),
                      onDismissed: (DismissDirection dir) {
                        _bloc.removeFromCartSink.add(RemoveFromCartEvent(_product, qty));
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: AppColors.primary,
                            content: Text(
                              "$_product removed from cart.",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .copyWith(color: AppColors.accentTextColor),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
                childCount: snapshot.data.keys.toList().length,
              ),
            );
          },
        ),
        SliverPersistentHeader(
          delegate: SliverAppBarDelegate(
            minHeight: Spacing.matGridUnit(scale: 4),
            maxHeight: Spacing.matGridUnit(scale: 8),
            child: Center(
              child: Text(
                "Cart Total: 5.00",
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
