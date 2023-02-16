import 'package:mobx/mobx.dart';

import '../../../../models/make_pizza.dart';
import '../../../../service/make_pizza/make_pizza_service.dart';
import '../models/cheese_model.dart';
import '../models/sauce_model.dart';
import '../models/tooping_model.dart';
import '../models/veggie_model.dart';

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
  @observable
  var cheeses = <CheeseModelStore>[].asObservable();
  @observable
  var toppings = <ToopingModelStore>[].asObservable();
  @observable
  var veggies = <VeggieModelStore>[].asObservable();

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
      result['cheese'].forEach((cheese) {
        cheeses.add(
          CheeseModelStore(
            id: cheese['id'] as int,
            name: cheese['name'] as String,
            price: cheese['price'] as double,
          ),
        );
      });
      result['topping'].forEach((topping) {
        toppings.add(
          ToopingModelStore(
            id: topping['id'] as int,
            name: topping['name'] as String,
            price: topping['price'] as double,
          ),
        );
      });
      result['veggie'].forEach((veggie) {
        veggies.add(
          VeggieModelStore(
            id: veggie['id'] as int,
            name: veggie['name'] as String,
            price: veggie['price'] as double,
          ),
        );
      });
    }
  }
}
