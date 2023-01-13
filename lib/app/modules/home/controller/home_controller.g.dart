// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$pizzasListAtom =
      Atom(name: 'HomeControllerBase.pizzasList', context: context);

  @override
  ObservableList<dynamic> get pizzasList {
    _$pizzasListAtom.reportRead();
    return super.pizzasList;
  }

  @override
  set pizzasList(ObservableList<dynamic> value) {
    _$pizzasListAtom.reportWrite(value, super.pizzasList, () {
      super.pizzasList = value;
    });
  }

  late final _$getPizzasAsyncAction =
      AsyncAction('HomeControllerBase.getPizzas', context: context);

  @override
  Future<void> getPizzas() {
    return _$getPizzasAsyncAction.run(() => super.getPizzas());
  }

  @override
  String toString() {
    return '''
pizzasList: ${pizzasList}
    ''';
  }
}
