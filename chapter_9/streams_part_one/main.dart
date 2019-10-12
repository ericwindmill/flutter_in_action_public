import 'dart:async';

main() {
  var burgerStand = new TastyBurderRestaurant();
  burgerStand.deliverOrderToCook();

  burgerStand.newOrder("Burger");
  burgerStand.newOrder("Fries");
  burgerStand.newOrder("Fries, Animal Style");
  burgerStand.newOrder("Chicken nugs");
}

class TastyBurderRestaurant {
  StreamController _controller = StreamController();
  Stream get onNewOrder => _controller.stream;
  Cook cook = Cook();

  void deliverOrderToCook() {
    onNewOrder.listen((newOrder) {
      cook.prepareOrder(newOrder);
    });
  }

  void newOrder(String order) {
    _controller.add(order);
  }
}

class Cook {
  void prepareOrder(newOrder) {
    print("preparing $newOrder");
  }
}
