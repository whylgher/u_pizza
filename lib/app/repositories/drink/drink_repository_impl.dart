import './drink_repository.dart';
import '../../core/rest_client/rest_client.dart';

class DrinkRepositoryImpl implements DrinkRepository {
  final RestClient _restClient;

  DrinkRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<dynamic> getDrinks() async {
    final result = await _restClient.auth().get('/api/drink');
    return result.data;
  }
}
