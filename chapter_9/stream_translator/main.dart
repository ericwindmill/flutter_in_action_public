import 'dart:async';

import 'translator.dart';

void main() {
  var burgerStand = GoodBurgerRestaurant();
  burgerStand.turnOnTranslator();

  burgerStand.newOrder(55);
  burgerStand.newOrder(12);
}

class GoodBurgerRestaurant {
  Cook cook = Cook();
  StreamController _controller = StreamController.broadcast();

  Stream get onNewBurgerOrder => _controller.stream;

  void turnOnTranslator() {
    onNewBurgerOrder.transform(BeepBoopTranslator()).listen((data) => cook.prepareOrder(data));
  }

  void newOrder(int orderNum) {
    _controller.add(orderNum);
  }
}

class Cook {
  void prepareOrder(newOrder) {
    print("preparing $newOrder");
  }
}
