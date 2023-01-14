import 'package:mobx/mobx.dart';

import '../../../../models/drink_model.dart';

part 'product_model.g.dart';

class ProductModelStore = ProductModelBase with _$ProductModelStore;

abstract class ProductModelBase with Store {
  @observable
  DrinkModel drink;
  @observable
  int countItem;

  ProductModelBase({
    required this.drink,
    required this.countItem,
  });

  @action
  void setCountItem() {
    drink.countItem = countItem;
    drink.amount = drink.price * countItem;
  }
}
