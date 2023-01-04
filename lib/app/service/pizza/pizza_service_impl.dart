import './pizza_service.dart';
import '../../repositories/pizza/pizza_repository.dart';

class PizzaServiceImpl implements PizzaService {
  final PizzaRepository _pizzaRepository;

  PizzaServiceImpl({
    required PizzaRepository pizzaRepository,
  }) : _pizzaRepository = pizzaRepository;
  @override
  Future<dynamic> getPizzas() => _pizzaRepository.getPizzas();
}
