import 'package:mobx/mobx.dart';

import '../../../../models/drink_model.dart';
import '../../../../service/drink/drink_service.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  final DrinkService _drinkService;

  CartControllerBase({required DrinkService drinkService})
      : _drinkService = drinkService;

  @observable
  double total = 0;
  @observable
  ObservableList<DrinkModel> drinks = ObservableList.of([]);

  @action
  void sumTotal(List items) {
    for (var item in items) {
      total = total + item.amount;
    }
  }

  @action
  void addItem(int index) {
    if (drinks[index].countItem < 10) {
      drinks[index].countItem++;
      addTotal(drinks[index].price);
      print(drinks[index].countItem);
    }
  }

  @action
  void removeItem(int index) {
    if (drinks[index].countItem > 0) {
      drinks[index].countItem--;
      addTotal(-drinks[index].price);
      print(drinks[index].countItem);
    }
  }

  @action
  void addTotal(double value) {
    total = total + value;
  }

  @action
  Future<void> getDrinks() async {
    List<dynamic> allDrinks = await _drinkService.getDrinks();
    for (var drink in allDrinks) {
      DrinkModel drinkModel = DrinkModel.fromMap(drink);
      drinks.add(drinkModel);
    }
  }
}
