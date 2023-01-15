// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on CartControllerBase, Store {
  late final _$totalAtom =
      Atom(name: 'CartControllerBase.total', context: context);

  @override
  double get total {
    _$totalAtom.reportRead();
    return super.total;
  }

  @override
  set total(double value) {
    _$totalAtom.reportWrite(value, super.total, () {
      super.total = value;
    });
  }

  late final _$totalWithTaxAtom =
      Atom(name: 'CartControllerBase.totalWithTax', context: context);

  @override
  double get totalWithTax {
    _$totalWithTaxAtom.reportRead();
    return super.totalWithTax;
  }

  @override
  set totalWithTax(double value) {
    _$totalWithTaxAtom.reportWrite(value, super.totalWithTax, () {
      super.totalWithTax = value;
    });
  }

  late final _$drinksAtom =
      Atom(name: 'CartControllerBase.drinks', context: context);

  @override
  ObservableList<ProductModelStore> get drinks {
    _$drinksAtom.reportRead();
    return super.drinks;
  }

  @override
  set drinks(ObservableList<ProductModelStore> value) {
    _$drinksAtom.reportWrite(value, super.drinks, () {
      super.drinks = value;
    });
  }

  late final _$getDrinksAsyncAction =
      AsyncAction('CartControllerBase.getDrinks', context: context);

  @override
  Future<void> getDrinks() {
    return _$getDrinksAsyncAction.run(() => super.getDrinks());
  }

  late final _$placeOrdersAsyncAction =
      AsyncAction('CartControllerBase.placeOrders', context: context);

  @override
  Future<bool> placeOrders() {
    return _$placeOrdersAsyncAction.run(() => super.placeOrders());
  }

  late final _$CartControllerBaseActionController =
      ActionController(name: 'CartControllerBase', context: context);

  @override
  void addTax() {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.addTax');
    try {
      return super.addTax();
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sumTotal(List<dynamic> items) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.sumTotal');
    try {
      return super.sumTotal(items);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addItem(int index) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.addItem');
    try {
      return super.addItem(index);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeItem(int index) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTotal(double value) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.addTotal');
    try {
      return super.addTotal(value);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetTotal() {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.resetTotal');
    try {
      return super.resetTotal();
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
total: ${total},
totalWithTax: ${totalWithTax},
drinks: ${drinks}
    ''';
  }
}
