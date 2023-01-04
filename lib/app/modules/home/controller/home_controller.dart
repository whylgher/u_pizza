import 'package:mobx/mobx.dart';

import '../../../core/ui/widgets/loader.dart';
import '../../../service/pizza/pizza_service.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final PizzaService _pizzasService;

  HomeControllerBase({
    required PizzaService pizzaService,
  }) : _pizzasService = pizzaService;

  @observable
  ObservableList<dynamic> pizzasList = ObservableList<dynamic>.of([]);

  @action
  Future<void> getPizzas() async {
    Loader.show();
    List<dynamic> pizzas = await _pizzasService.getPizzas();
    for (var pizza in pizzas) {
      pizzasList.add(pizza);
    }
    Loader.hide();
  }
}
