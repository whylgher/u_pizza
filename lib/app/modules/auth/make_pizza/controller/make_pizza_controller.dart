import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../models/make_pizza.dart';
import '../../../../service/make_pizza/make_pizza_service.dart';

part 'make_pizza_controller.g.dart';

class MakePizzaController = MakePizzaControllerBase with _$MakePizzaController;

abstract class MakePizzaControllerBase with Store {
  final MakePizzaService _makePizzaService;

  MakePizzaControllerBase({
    required MakePizzaService makePizzaService,
  }) : _makePizzaService = makePizzaService;

  @observable
  var pizzas = <MakePizza>[].asObservable();

  @action
  Future<void> getPizzas() async {
    log(pizzas.toString());
    if (pizzas.isEmpty) {
      Map result = await _makePizzaService.getPizzas();
      pizzas.removeWhere((pizza) => pizza.id > 0);
      result['pizza'].forEach((pizza) {
        pizzas.add(MakePizza.fromMap(pizza));
      });
    }
  }
}
