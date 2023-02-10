import 'package:mobx/mobx.dart';

import '../../../../models/make_pizza.dart';
import '../../../../service/make_pizza/make_pizza_service.dart';
import '../models/sauce_model.dart';

part 'make_pizza_controller.g.dart';

class MakePizzaController = MakePizzaControllerBase with _$MakePizzaController;

abstract class MakePizzaControllerBase with Store {
  final MakePizzaService _makePizzaService;

  MakePizzaControllerBase({
    required MakePizzaService makePizzaService,
  }) : _makePizzaService = makePizzaService;

  @observable
  var pizzas = <MakePizza>[].asObservable();
  @observable
  var sauces = <SauceModelStore>[].asObservable();

  @action
  Future<void> getPizzas() async {
    if (pizzas.isEmpty) {
      Map result = await _makePizzaService.getPizzas();
      result['pizza'].forEach((pizza) {
        pizzas.add(MakePizza.fromMap(pizza));
      });
      result['sauce'].forEach((sauce) {
        sauces.add(
          SauceModelStore(
            id: sauce['id'] as int,
            name: sauce['name'] as String,
            price: sauce['price'] as double,
          ),
        );
      });
    }
  }
}
