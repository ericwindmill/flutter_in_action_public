import 'package:flutter/material.dart';

final double kToolbarHeight = 56.0;
double appBarHeight(BuildContext context) {
  return screenAwareSize(kToolbarHeight, context);
}

const double kBaseHeight = 650.0;
double screenAwareSize(double size, BuildContext context) {
  double drawingHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
  return size * drawingHeight / kBaseHeight;
}
