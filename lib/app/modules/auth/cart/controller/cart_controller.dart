import 'package:mobx/mobx.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  @observable
  double total = 0;

  @action
  void sumTotal(List items) {
    items.forEach((item) {
      total = total + item.amount;
    });
  }
}
