import 'dart:convert';

import 'package:mobx/mobx.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../../models/order_model.dart';
import '../../../../models/user_model.dart';
import '../../../../service/order/order_service.dart';

part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final LocalStorage _localStorage;
  final OrderService _orderService;

  OrderControllerBase({
    required LocalStorage localStorage,
    required OrderService orderService,
  })  : _localStorage = localStorage,
        _orderService = orderService;

  @observable
  UserModel user = UserModel.empty();

  @observable
  ObservableList<OrderModel> ordersModel = ObservableList<OrderModel>.of([]);

  @observable
  bool showDrink = true;

  @action
  void showDrinks(bool show) {
    showDrink = show;
  }

  @action
  Future<void> getOrders() async {
    ordersModel = ObservableList<OrderModel>.of([]);
    final userData = jsonDecode(
        await _localStorage.read(Constants.LOCAL_STORAGE_USER_LOGGED_DATA));
    user = UserModel.fromMap(userData);
    final orders = await _orderService.getOrders(user.data['id']);

    if (orders['order'].length == 1) {
      orders['order'].forEach((e) {
        ordersModel.add(OrderModel.fromMap(e));
      });
    } else {
      orders['order'].values.forEach((e) {
        ordersModel.add(OrderModel.fromMap(e));
      });
    }
  }
}
