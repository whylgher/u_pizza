import './make_pizza_repository.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

class MakePizzaRepositoryImpl implements MakePizzaRepository {
  final RestClient _restClient;
  final AppLogger _log;

  MakePizzaRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;
  @override
  Future<Map> getPizzas() async {
    final result = await _restClient.auth().get('/api/v1/make_pizza');
    return result.data;
  }

  @override
  Future<Map> getSauces() async {
    final result = await _restClient.auth().get('/api/v1/sauce');
    return result.data;
  }
}
