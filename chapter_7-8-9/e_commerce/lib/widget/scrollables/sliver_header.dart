/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CustomSliverHeader extends StatelessWidget {
  final double scrollPosition;
  final String headerText;
  final Function onTap;

  const CustomSliverHeader({Key key, this.scrollPosition, this.headerText, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: Spacing.matGridUnit(scale: 4),
        maxHeight: Spacing.matGridUnit(scale: 8),
        child: Container(
          color: Theme.of(context).backgroundColor,
          child: GestureDetector(
            onTap: () => onTap(this.headerText),
            child: Stack(
              children: <Widget>[
                Center(
                  child:
                      Container(decoration: BoxDecoration(color: AppColors.textColor), height: .5),
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: Spacing.matGridUnit()),
                    decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
                    child: Text(
                      headerText,
                      style: Theme.of(context).textTheme.subhead,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
