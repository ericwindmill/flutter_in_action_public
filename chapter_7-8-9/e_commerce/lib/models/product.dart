import 'package:e_commerce/utils/product_seeds.dart';
import 'package:e_commerce/utils/uuid.dart';

class Product {
  String id;
  ImageTitle imageTitle;
  String title;
  ProductCategory category;
  double cost;

  Product({
    this.id,
    this.imageTitle,
    this.title,
    this.category,
    this.cost,
  });

  String get imageUrl => productImageFile[imageTitle];

  String get uniqueId => Uuid().generateV4();
}

enum ProductCategory {
  Veggies,
  Fruit,
  Treats,
  Nuts,
  Protein,
  Cooking,
}

enum ImageTitle {
  AppleInHand,
  Apricots,
  Asparagus,
  AvocadoHalf,
  AvocadoTwoHalves,
  BlueberriesInHand,
  BlueberriesPile,
  BroccoliPieces,
  BrusselSprouts,
  CacaoBeans,
  Carrots,
  Chesnuts,
  ChoppedVeggies,
  Cupcake,
  Eggs,
  FrozenTreat,
  FruitStand,
  Lettuce,
  Lime,
  Milkshake,
  MilkshakeInHand,
  Nectarines,
  Oranges,
  Papaya,
  PopcicleInHand,
  SlicedOranges,
  SpoonsFullOfSpices,
  StrawberriesInHand,
  Walnuts,
}

// Convenience class that bridges user input with adding products to the database.
class NewProduct {
  double cost;
  String title;
  ProductCategory category;
  DateTime dateAdded;

  @override
  String toString() {
    return 'NewProduct{cost: $cost, title: $title, category: $category}';
  }
}
