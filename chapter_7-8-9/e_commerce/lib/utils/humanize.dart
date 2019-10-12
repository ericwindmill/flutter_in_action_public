import 'package:e_commerce/models/product.dart';

class Humanize {
  static String productCategoryFromEnum(ProductCategory c) {
    return c.toString().split(".").last;
  }
 }