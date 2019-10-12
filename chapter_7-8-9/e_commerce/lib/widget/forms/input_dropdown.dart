/*
 * Copyright 2018 Eric Windmill. All rights reserved.
 * Use of this source code is governed by the MIT license that can be found in the LICENSE file.
 */

import 'package:flutter/material.dart';

class DateInputField extends StatelessWidget {
  const DateInputField(
      {Key key,
      this.child,
      this.labelText,
      this.valueText,
      this.valueStyle,
      this.onPressed,
      this.inputDecoration})
      : assert(labelText != null),
        super(key: key);

  final String labelText;
  final String valueText;
  final TextStyle valueStyle;
  final VoidCallback onPressed;
  final Widget child;
  final InputDecoration inputDecoration;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: InputDecorator(
        decoration: valueText == null
            ? InputDecoration(
                border: OutlineInputBorder(),
              )
            : InputDecoration(
                labelText: labelText,
                border: OutlineInputBorder(),
              ),
        baseStyle: valueStyle,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            valueText != null
                ? Text(valueText, style: valueStyle)
                : Text(labelText, style: valueStyle),
            Icon(Icons.calendar_today,
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade700
                    : Colors.white70),
          ],
        ),
      ),
    );
  }
}
