// ignore_for_file: unused_field

import './pizza_repository.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

class PizzaRepositoryImpl implements PizzaRepository {
  final RestClient _restClient;
  final AppLogger _log;

  PizzaRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
    required LocalStorage localStorage,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<dynamic> getPizzas() async {
    final result = await _restClient.unAuth().get('/api/pizzas');
    return result.data;
  }
}
