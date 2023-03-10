// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on OrderControllerBase, Store {
  late final _$userAtom =
      Atom(name: 'OrderControllerBase.user', context: context);

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$ordersModelAtom =
      Atom(name: 'OrderControllerBase.ordersModel', context: context);

  @override
  ObservableList<OrderModel> get ordersModel {
    _$ordersModelAtom.reportRead();
    return super.ordersModel;
  }

  @override
  set ordersModel(ObservableList<OrderModel> value) {
    _$ordersModelAtom.reportWrite(value, super.ordersModel, () {
      super.ordersModel = value;
    });
  }

  late final _$showDrinkAtom =
      Atom(name: 'OrderControllerBase.showDrink', context: context);

  @override
  bool get showDrink {
    _$showDrinkAtom.reportRead();
    return super.showDrink;
  }

  @override
  set showDrink(bool value) {
    _$showDrinkAtom.reportWrite(value, super.showDrink, () {
      super.showDrink = value;
    });
  }

  late final _$getOrdersAsyncAction =
      AsyncAction('OrderControllerBase.getOrders', context: context);

  @override
  Future<void> getOrders() {
    return _$getOrdersAsyncAction.run(() => super.getOrders());
  }

  late final _$OrderControllerBaseActionController =
      ActionController(name: 'OrderControllerBase', context: context);

  @override
  void showDrinks(bool show) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.showDrinks');
    try {
      return super.showDrinks(show);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
ordersModel: ${ordersModel},
showDrink: ${showDrink}
    ''';
  }
}
