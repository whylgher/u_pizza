import 'dart:convert';

import './address_repository.dart';
import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../models/user_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  final LocalStorage _localStorage;
  final RestClient _restClient;
  final AppLogger _log;

  AddressRepositoryImpl({
    required LocalStorage localStorage,
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
        _log = log,
        _localStorage = localStorage;

  @override
  Future<Map> getAllAddresses() async {
    try {
      final userData = jsonDecode(
          await _localStorage.read(Constants.LOCAL_STORAGE_USER_LOGGED_DATA));

      final user = UserModel.fromMap(userData);

      final address =
          await _restClient.auth().get('/api/addresses/${user.data['id']}');

      return address.data;
    } on Exception catch (e) {
      _log.error('Error get all Addresses', e);
      throw Exception();
    }
  }

  @override
  Future<void> addNewAddress(Map map) async {
    final address = await _restClient.auth().post(
          '/api/address/create',
          data: map,
        );
    print(address.data);
  }
}
