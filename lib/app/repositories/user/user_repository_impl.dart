import './user_repository.dart';
import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../core/rest_client/rest_client.dart';
import '../../core/rest_client/rest_client_exception.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final AppLogger _log;

  UserRepositoryImpl({
    required RestClient restClient,
    required AppLogger log,
  })  : _restClient = restClient,
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

      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      if (e.statusCode == 403) {
        throw Failure(
            message:
                'Usuário ou senha inválidos. Caso o erro persistir entre em contato com suporte.');
      }
      if (e.statusCode == 302) {
        _log.error(e);
        throw Failure(message: 'Informar suporte.');
      }

      _log.error('Erro ao realizar login', e, s);

      throw Failure(
          message: 'Erro ao realizar login, tente novamente mais tarde.');
    }
  }
}
