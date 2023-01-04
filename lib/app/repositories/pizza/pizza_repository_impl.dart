import './pizza_repository.dart';
import '../../core/rest_client/rest_client.dart';

class PizzaRepositoryImpl implements PizzaRepository {
  final RestClient _restClient;

  PizzaRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;
  @override
  Future<dynamic> getPizzas() async {
    final result = await _restClient.unAuth().get('/api/pizzas');
    return result.data;
  }
}
