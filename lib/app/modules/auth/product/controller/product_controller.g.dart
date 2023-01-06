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

  late final _$pricefinallyAtom =
      Atom(name: 'ProductControllerBase.pricefinally', context: context);

  @override
  double get pricefinally {
    _$pricefinallyAtom.reportRead();
    return super.pricefinally;
  }

  @override
  set pricefinally(double value) {
    _$pricefinallyAtom.reportWrite(value, super.pricefinally, () {
      super.pricefinally = value;
    });
  }

  late final _$valueAtom =
      Atom(name: 'ProductControllerBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
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
  double setPrice(double value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void icrement() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.icrement');
    try {
      return super.icrement();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pizza: ${pizza},
priceTotaly: ${priceTotaly},
pricefinally: ${pricefinally},
value: ${value}
    ''';
  }
}
