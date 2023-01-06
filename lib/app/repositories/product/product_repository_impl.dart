import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import './product_repository.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/ui/widgets/messages.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RestClient _restClient;
  final AppLogger _log;

  ProductRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<Map<String, dynamic>> getPizza(int id) async {
    try {
      String url = '/api/pizza/$id';
      final result = await _restClient.auth().get(url);
      return result.data;
    } on Exception catch (e) {
      FirebaseAuth.instance.signOut();
      Modular.to.navigate('/auth/login');
      _log.error('Usuário não logado', e);
      Messages.alert('You must be logged.');
      throw Exception;
    }
  }
}
