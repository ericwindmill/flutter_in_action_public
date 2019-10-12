import 'dart:async';

class Cook {
  void prepareOrder(newOrder) {
    print("preparing $newOrder");
  }
}

class Order {}

class Burger extends Order {}

class Fries extends Order {}

class BurgerStand {
  StreamController<Order> _controller = new StreamController.broadcast();
  Cook grillCook = new Cook();
  Cook fryCook = new Cook();

  Stream get onNewBurgerOrder => _controller.stream.where((Order order) => (order is Burger));
  Stream get onNewFryOrder => _controller.stream.where((Order order) => (order is Fries));

  void deliverOrderToCook() {
    onNewBurgerOrder.listen((newOrder) {
      grillCook.prepareOrder(newOrder);
    });

    onNewFryOrder.listen((newOrder) {
      fryCook.prepareOrder(newOrder);
    });
  }

  void newOrder(Order order) {
    _controller.add(order);
  }
}

main() {
  var burgerStand = new BurgerStand();
  burgerStand.deliverOrderToCook();

  burgerStand.newOrder(new Burger());
  burgerStand.newOrder(new Fries());
}
