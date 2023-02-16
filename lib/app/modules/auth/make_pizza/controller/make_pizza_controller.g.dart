// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_pizza_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MakePizzaController on MakePizzaControllerBase, Store {
  late final _$pizzasAtom =
      Atom(name: 'MakePizzaControllerBase.pizzas', context: context);

  @override
  ObservableList<MakePizza> get pizzas {
    _$pizzasAtom.reportRead();
    return super.pizzas;
  }

  @override
  set pizzas(ObservableList<MakePizza> value) {
    _$pizzasAtom.reportWrite(value, super.pizzas, () {
      super.pizzas = value;
    });
  }

  late final _$saucesAtom =
      Atom(name: 'MakePizzaControllerBase.sauces', context: context);

  @override
  ObservableList<SauceModelStore> get sauces {
    _$saucesAtom.reportRead();
    return super.sauces;
  }

  @override
  set sauces(ObservableList<SauceModelStore> value) {
    _$saucesAtom.reportWrite(value, super.sauces, () {
      super.sauces = value;
    });
  }

  late final _$cheesesAtom =
      Atom(name: 'MakePizzaControllerBase.cheeses', context: context);

  @override
  ObservableList<CheeseModelStore> get cheeses {
    _$cheesesAtom.reportRead();
    return super.cheeses;
  }

  @override
  set cheeses(ObservableList<CheeseModelStore> value) {
    _$cheesesAtom.reportWrite(value, super.cheeses, () {
      super.cheeses = value;
    });
  }

  late final _$toppingsAtom =
      Atom(name: 'MakePizzaControllerBase.toppings', context: context);

  @override
  ObservableList<ToopingModelStore> get toppings {
    _$toppingsAtom.reportRead();
    return super.toppings;
  }

  @override
  set toppings(ObservableList<ToopingModelStore> value) {
    _$toppingsAtom.reportWrite(value, super.toppings, () {
      super.toppings = value;
    });
  }

  late final _$veggiesAtom =
      Atom(name: 'MakePizzaControllerBase.veggies', context: context);

  @override
  ObservableList<VeggieModelStore> get veggies {
    _$veggiesAtom.reportRead();
    return super.veggies;
  }

  @override
  set veggies(ObservableList<VeggieModelStore> value) {
    _$veggiesAtom.reportWrite(value, super.veggies, () {
      super.veggies = value;
    });
  }

  late final _$getPizzasAsyncAction =
      AsyncAction('MakePizzaControllerBase.getPizzas', context: context);

  @override
  Future<void> getPizzas() {
    return _$getPizzasAsyncAction.run(() => super.getPizzas());
  }

  @override
  String toString() {
    return '''
pizzas: ${pizzas},
sauces: ${sauces},
cheeses: ${cheeses},
toppings: ${toppings},
veggies: ${veggies}
    ''';
  }
}
