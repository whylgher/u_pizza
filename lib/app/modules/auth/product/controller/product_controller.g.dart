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
  Map<dynamic, dynamic> get pizza {
    _$pizzaAtom.reportRead();
    return super.pizza;
  }

  @override
  set pizza(Map<dynamic, dynamic> value) {
    _$pizzaAtom.reportWrite(value, super.pizza, () {
      super.pizza = value;
    });
  }

  late final _$bordersAtom =
      Atom(name: 'ProductControllerBase.borders', context: context);

  @override
  List<dynamic> get borders {
    _$bordersAtom.reportRead();
    return super.borders;
  }

  @override
  set borders(List<dynamic> value) {
    _$bordersAtom.reportWrite(value, super.borders, () {
      super.borders = value;
    });
  }

  late final _$additionalsAtom =
      Atom(name: 'ProductControllerBase.additionals', context: context);

  @override
  List<dynamic> get additionals {
    _$additionalsAtom.reportRead();
    return super.additionals;
  }

  @override
  set additionals(List<dynamic> value) {
    _$additionalsAtom.reportWrite(value, super.additionals, () {
      super.additionals = value;
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

  late final _$priceAdditionalAtom =
      Atom(name: 'ProductControllerBase.priceAdditional', context: context);

  @override
  double get priceAdditional {
    _$priceAdditionalAtom.reportRead();
    return super.priceAdditional;
  }

  @override
  set priceAdditional(double value) {
    _$priceAdditionalAtom.reportWrite(value, super.priceAdditional, () {
      super.priceAdditional = value;
    });
  }

  late final _$priceBorderAtom =
      Atom(name: 'ProductControllerBase.priceBorder', context: context);

  @override
  double get priceBorder {
    _$priceBorderAtom.reportRead();
    return super.priceBorder;
  }

  @override
  set priceBorder(double value) {
    _$priceBorderAtom.reportWrite(value, super.priceBorder, () {
      super.priceBorder = value;
    });
  }

  late final _$itemAdditionalAtom =
      Atom(name: 'ProductControllerBase.itemAdditional', context: context);

  @override
  int get itemAdditional {
    _$itemAdditionalAtom.reportRead();
    return super.itemAdditional;
  }

  @override
  set itemAdditional(int value) {
    _$itemAdditionalAtom.reportWrite(value, super.itemAdditional, () {
      super.itemAdditional = value;
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

  late final _$cutPizzaAtom =
      Atom(name: 'ProductControllerBase.cutPizza', context: context);

  @override
  bool get cutPizza {
    _$cutPizzaAtom.reportRead();
    return super.cutPizza;
  }

  @override
  set cutPizza(bool value) {
    _$cutPizzaAtom.reportWrite(value, super.cutPizza, () {
      super.cutPizza = value;
    });
  }

  late final _$regularAtom =
      Atom(name: 'ProductControllerBase.regular', context: context);

  @override
  bool get regular {
    _$regularAtom.reportRead();
    return super.regular;
  }

  @override
  set regular(bool value) {
    _$regularAtom.reportWrite(value, super.regular, () {
      super.regular = value;
    });
  }

  late final _$largeAtom =
      Atom(name: 'ProductControllerBase.large', context: context);

  @override
  bool get large {
    _$largeAtom.reportRead();
    return super.large;
  }

  @override
  set large(bool value) {
    _$largeAtom.reportWrite(value, super.large, () {
      super.large = value;
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
  void incrementAdditional(double value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.incrementAdditional');
    try {
      return super.incrementAdditional(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementAdditional(double value) {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.decrementAdditional');
    try {
      return super.decrementAdditional(value);
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cutInHalf() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.cutInHalf');
    try {
      return super.cutInHalf();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void notCutPizza() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.notCutPizza');
    try {
      return super.notCutPizza();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sizePizzaLarge() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.sizePizzaLarge');
    try {
      return super.sizePizzaLarge();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sizePizzaRegular() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.sizePizzaRegular');
    try {
      return super.sizePizzaRegular();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void set() {
    final _$actionInfo = _$ProductControllerBaseActionController.startAction(
        name: 'ProductControllerBase.set');
    try {
      return super.set();
    } finally {
      _$ProductControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pizza: ${pizza},
borders: ${borders},
additionals: ${additionals},
price: ${price},
priceAdditional: ${priceAdditional},
priceBorder: ${priceBorder},
itemAdditional: ${itemAdditional},
priceTotaly: ${priceTotaly},
item: ${item},
cutPizza: ${cutPizza},
regular: ${regular},
large: ${large}
    ''';
  }
}
