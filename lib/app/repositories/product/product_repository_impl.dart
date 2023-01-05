import './product_repository.dart';
import '../../core/rest_client/rest_client.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;

  ProductRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Map<String, dynamic>> getPizza(int id) async {
    String url = '/api/pizza/$id';
    final result = await _restClient.auth().get(url);
    return result.data;
  }
}
