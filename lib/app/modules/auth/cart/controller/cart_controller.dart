import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:u_pizzas/app/core/ui/widgets/messages.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/local_storage/local_storage.dart';
import '../../../../models/drink_model.dart';
import '../../../../models/user_model.dart';
import '../../../../service/drink/drink_service.dart';
import '../../product/controller/product_controller.dart';
import '../model/product_model.dart';

part 'cart_controller.g.dart';

class CartController = CartControllerBase with _$CartController;

abstract class CartControllerBase with Store {
  final DrinkService _drinkService;
  final LocalStorage _localStorage;

  CartControllerBase({
    required DrinkService drinkService,
    required LocalStorage localStorage,
  })  : _drinkService = drinkService,
        _localStorage = localStorage;

  @observable
  double total = 0;

  @observable
  double totalWithTax = 0;

  @observable
  var drinks = <ProductModelStore>[].asObservable();

  @action
  void addTax() {
    totalWithTax = total * .07 + total;
  }

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
      addTotal(drinks[index].drink.price);
      drinks[index].setCountItem();
    }
  }

  @action
  void removeItem(int index) {
    if (drinks[index].countItem > 0) {
      drinks[index].countItem--;
      addTotal(-drinks[index].drink.price);
      drinks[index].setCountItem();
    }
  }

  @action
  void addTotal(double value) {
    total = total + value;
  }

  @action
  void resetTotal() {
    total = 0;
    for (var drink in drinks) {
      total = total + (drink.drink.price * drink.countItem);
    }
  }

  @action
  Future<void> getDrinks() async {
    List<dynamic> allDrinks = await _drinkService.getDrinks();
    for (var drink in allDrinks) {
      DrinkModel drinkModel = DrinkModel.fromMap(drink);
      var productData = ProductModelStore(countItem: 0, drink: drinkModel);
      drinks.add(productData);
    }
  }

  @action
  Future<void> placeOrders() async {
    final controllerProduct = Modular.get<ProductController>();

    try {
      addTax();
      final userData = jsonDecode(
          await _localStorage.read(Constants.LOCAL_STORAGE_USER_LOGGED_DATA));
      final user = UserModel.fromMap(userData);
      List orders =
          controllerProduct.cartList.map((item) => item.toJson()).toList();
      List orderDrink =
          drinks.map((element) => element.drink.toJson()).toList();

      final purchase = {
        'user_id': user.data['id'],
        'name': controllerProduct.cartList[0].name,
        'description': controllerProduct.cartList[0].description,
        'status': 'WAITING',
        'amount': total,
        'tax': total * .07,
        'total': totalWithTax,
        'order': orders,
        'drink': orderDrink,
      };
      print(purchase);
      if (controllerProduct.cartList.isEmpty) {
        throw Exception();
      }
    } on Exception {
      Messages.alert('Empty Car');
      throw Exception();
    }
  }
}
