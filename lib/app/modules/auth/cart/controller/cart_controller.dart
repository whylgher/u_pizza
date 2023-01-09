import 'package:mobx/mobx.dart';

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
  ObservableList drinks = ObservableList.of([]);

  @action
  void sumTotal(List items) {
    items.forEach((item) {
      total = total + item.amount;
    });
  }

  @action
  Future<void> getDrinks() async {
    List<dynamic> allDrinks = await _drinkService.getDrinks();
    allDrinks.forEach((drink) {
      drinks.add(drink);
    });
  }
}
