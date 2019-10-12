/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:e_commerce/utils/styles.dart';
import 'package:flutter/material.dart';

class FormFieldContainer extends StatelessWidget {
  final Widget child;

  FormFieldContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: Spacing.matGridUnit(scale: 2)),
      child: child,
    );
  }
}
