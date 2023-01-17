import './order_repository.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';

class OrderRepositoryImpl implements OrderRepository {
  final RestClient _restClient;
  final AppLogger _log;

  OrderRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<Map<String, dynamic>> getOrders(int id) async {
    try {
      final data = await _restClient.auth().get('/api/order/client/$id');
      return data.data;
    } on Exception catch (e, s) {
      _log.error('Error', e, s);
      throw Error();
    }
  }
}
