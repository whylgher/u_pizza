// ignore_for_file: unused_field

import './pizza_service.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../repositories/pizza/pizza_repository.dart';

class PizzaServiceImpl implements PizzaService {
  final AppLogger _log;
  final LocalStorage _localStorage;
  final PizzaRepository _pizzaRepository;

  PizzaServiceImpl({
    required AppLogger log,
    required LocalStorage localStorage,
    required PizzaRepository pizzaRepository,
  })  : _localStorage = localStorage,
        _pizzaRepository = pizzaRepository,
        _log = log;

  @override
  Future<dynamic> getPizzas() => _pizzaRepository.getPizzas();
}
