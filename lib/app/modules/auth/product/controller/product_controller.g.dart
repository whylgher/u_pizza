// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  late final _$pizzaAtom =
      Atom(name: 'ProductControllerBase.pizza', context: context);

  @override
  ObservableList<dynamic> get pizza {
    _$pizzaAtom.reportRead();
    return super.pizza;
  }

  @override
  set pizza(ObservableList<dynamic> value) {
    _$pizzaAtom.reportWrite(value, super.pizza, () {
      super.pizza = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'ProductControllerBase.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$priceTotalyAtom =
      Atom(name: 'ProductControllerBase.priceTotaly', context: context);

  @override
  double get priceTotaly {
    _$priceTotalyAtom.reportRead();
    return super.priceTotaly;
  }

  @override
  set priceTotaly(double value) {
    _$priceTotalyAtom.reportWrite(value, super.priceTotaly, () {
      super.priceTotaly = value;
    });
  }

  late final _$itemAtom =
      Atom(name: 'ProductControllerBase.item', context: context);

  @override
  int get item {
    _$itemAtom.reportRead();
    return super.item;
  }

  @override
  set item(int value) {
    _$itemAtom.reportWrite(value, super.item, () {
      super.item = value;
    });
  }

  late final _$getPizzaAsyncAction =
      AsyncAction('ProductControllerBase.getPizza', context: context);

  @override
  Future<void> getPizza(int id) {
    return _$getPizzaAsyncAction.run(() => super.getPizza(id));
  }

  late final _$ProductControllerBaseActionController =
      ActionController(name: 'ProductControllerBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pizza: ${pizza},
price: ${price},
priceTotaly: ${priceTotaly},
item: ${item}
    ''';
  }
}
