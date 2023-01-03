import 'package:u_pizzas/app/models/user_model.dart';

import './user_repository.dart';
import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/helpers/constants.dart';
import '../../core/local_storage/local_storage.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final LocalStorage _localStorage;
  final AppLogger _log;

  UserRepositoryImpl(
      {required RestClient restClient,
      required AppLogger log,
      required LocalStorage localStorage})
      : _restClient = restClient,
        _localStorage = localStorage,
        _log = log;

  @override
  Future<void> register(
      String email, String name, String password, String phone) async {
    try {
      await _restClient.unAuth().post('/api/register', data: {
        'name': name,
        'password': password,
        'email': email,
        "social_login": "APP",
        'phone': phone,
        "img_url": "",
        "android_token": "IOS_asdqweasdzxc",
        "ios_token": ""
      });
    } on RestClientException catch (e, s) {
      if (e.statusCode == 400) {
        _log.error(e.error, e, s);
        throw UserExistsException();
      }
      if (e.statusCode == 500) {
        _log.error(e.error, e, s);
      }

      _log.error('Erro ao cadastrar usuário', e, s);
      throw Failure(message: 'Erro ao registrar usuário.');
    }
  }

  @override
  Future<String> login(String email, String password) async {
    try {
      final result = await _restClient.unAuth().post('/api/login', data: {
        'password': password,
        'email': email,
      });

      return result.data['authorisation']['token'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw Failure(
            message:
                'Usuário ou senha inválidos. Caso o erro persistir entre em contato com suporte.');
      }
      if (e.statusCode == 302) {
        _log.error(e);
        throw Failure(
            message: 'Caso o erro persistir entre em contato com suporte.');
      }

      _log.error('Erro ao realizar login', e, s);

      throw Failure(
          message: 'Erro ao realizar login, tente novamente mais tarde.');
    }
  }

  @override
  Future<UserModel> getUserLogged(accessToken) async {
    try {
      print('LOCAL_STORAGE_ACCESS_TOKEN_KEY');
      print(await _localStorage
          .read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY));
      final result = await _restClient.get(
        '/api/user',
        headers: {
          'Authorization':
              'Bearer ${await _localStorage.read<String>(Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY)}',
        },
      );
      return UserModel.fromMap(result.data);
    } on RestClientException catch (e, s) {
      _log.error('Erro ao buscar dados do usuário logado', e, s);
      throw Failure(message: 'Erro ao buscar dados do usuário logado');
    }
  }
}
