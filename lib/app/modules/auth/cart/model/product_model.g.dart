// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductModelStore on ProductModelBase, Store {
  late final _$drinkAtom =
      Atom(name: 'ProductModelBase.drink', context: context);

  @override
  DrinkModel get drink {
    _$drinkAtom.reportRead();
    return super.drink;
  }

  @override
  set drink(DrinkModel value) {
    _$drinkAtom.reportWrite(value, super.drink, () {
      super.drink = value;
    });
  }

  late final _$countItemAtom =
      Atom(name: 'ProductModelBase.countItem', context: context);

  @override
  int get countItem {
    _$countItemAtom.reportRead();
    return super.countItem;
  }

  @override
  set countItem(int value) {
    _$countItemAtom.reportWrite(value, super.countItem, () {
      super.countItem = value;
    });
  }

  late final _$ProductModelBaseActionController =
      ActionController(name: 'ProductModelBase', context: context);

  @override
  void setCountItem() {
    final _$actionInfo = _$ProductModelBaseActionController.startAction(
        name: 'ProductModelBase.setCountItem');
    try {
      return super.setCountItem();
    } finally {
      _$ProductModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
drink: ${drink},
countItem: ${countItem}
    ''';
  }
}
