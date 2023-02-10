// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:u_pizzas/app/repositories/make_pizza/make_pizza_repository.dart';

import './make_pizza_service.dart';

class MakePizzaServiceImpl implements MakePizzaService {
  final MakePizzaRepository _makePizzaRepository;
  MakePizzaServiceImpl({
    required MakePizzaRepository makePizzaRepository,
  }) : _makePizzaRepository = makePizzaRepository;

  @override
  Future<Map> getPizzas() => _makePizzaRepository.getPizzas();

  @override
  Future<Map> getSauces() => _makePizzaRepository.getSauces();
}
