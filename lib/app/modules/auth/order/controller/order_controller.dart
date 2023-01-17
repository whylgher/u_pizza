// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mobx/mobx.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../../models/user_model.dart';

part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  final LocalStorage _localStorage;

  OrderControllerBase({
    required LocalStorage localStorage,
  }) : _localStorage = localStorage;

  @observable
  UserModel user = UserModel.empty();

  @action
  Future<void> getOrders() async {
    final userData = jsonDecode(
        await _localStorage.read(Constants.LOCAL_STORAGE_USER_LOGGED_DATA));
    user = UserModel.fromMap(userData);
  }
}
