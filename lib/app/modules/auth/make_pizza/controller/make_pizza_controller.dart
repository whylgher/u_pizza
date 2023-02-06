import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../service/make_pizza/make_pizza_service.dart';

part 'make_pizza_controller.g.dart';

class MakePizzaController = MakePizzaControllerBase with _$MakePizzaController;

abstract class MakePizzaControllerBase with Store {
  final MakePizzaService _makePizzaService;

  MakePizzaControllerBase({
    required MakePizzaService makePizzaService,
  }) : _makePizzaService = makePizzaService;

  @action
  Future<void> getPizzas() async {
    final result = await _makePizzaService.getPizzas();
    log(result['pizza'].toString());
  }
}
