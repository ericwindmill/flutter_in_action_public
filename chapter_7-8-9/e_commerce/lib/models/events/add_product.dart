import 'package:e_commerce/models/product.dart';
import 'package:e_commerce/models/user.dart';

class NewUserProductEvent {
  final NewProduct product;

  NewUserProductEvent(this.product);
}

class UpdateUserEvent {
  ECommerceUser user;

  UpdateUserEvent(this.user);
}

abstract class ProductEvent {
  NewProduct product;
  ProductEvent(this.product);
}

class AddProductEvent extends ProductEvent {
  AddProductEvent(NewProduct product) : super(product);
}

class UpdateProductEvent extends ProductEvent {
  UpdateProductEvent(NewProduct product) : super(product);
}

class RouteChangeEvent {
  final String route;

  RouteChangeEvent(this.route);
}
