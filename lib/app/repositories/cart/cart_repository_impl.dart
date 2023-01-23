import './cart_repository.dart';
import '../../core/rest_client/rest_client.dart';

class CartRepositoryImpl implements CartRepository {
  final RestClient _restClient;

  CartRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<Map> purchase(Map<String, dynamic> map) async {
    final pursh = await _restClient.auth().post(
          '/api/order/create',
          data: map,
        );
    return pursh.data;
  }
}
