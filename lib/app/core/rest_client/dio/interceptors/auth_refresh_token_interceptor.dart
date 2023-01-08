// ignore_for_file: unnecessary_null_comparison

import 'package:dio/dio.dart';

import '../../../../modules/core/auth/auth_store.dart';
import '../../../exception/expire_token_exception.dart';
import '../../../helpers/constants.dart';
import '../../../local_storage/local_storage.dart';
import '../../../logger/app_logger.dart';
import '../../rest_client.dart';

class AuthRefreshTokenInterceptor extends Interceptor {
  final AuthStore _authStore;
  final LocalStorage _localStorage;
  final LocalSecureStorage _localSecureStorage;
  final RestClient _restClient;
  final AppLogger _log;
  AuthRefreshTokenInterceptor({
    required AuthStore authStore,
    required LocalStorage localStorage,
    required LocalSecureStorage localSecureStorage,
    required RestClient restClient,
    required AppLogger log,
  })  : _authStore = authStore,
        _localStorage = localStorage,
        _localSecureStorage = localSecureStorage,
        _restClient = restClient,
        _log = log;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    try {
      final responseStatusCode = err.response?.statusCode ?? 0;
      final requestPath = err.requestOptions.path;

      if (responseStatusCode == 403 || responseStatusCode == 401) {
        if (requestPath != '/api/refresh') {
          final authRequired = err.requestOptions
                  .extra[Constants.REST_CLIENT_AUTH_REQUIRED_KEY] ??
              false;
          if (authRequired) {
            _log.info('################## Refresh Token ##################');
            await _refreshToken(err);
            await _retryRequest(err, handler);
          } else {
            throw err;
          }
        } else {
          throw err;
        }
      } else {
        throw err;
      }
    } on ExpireTokenException {
      _authStore.logout();
      handler.next(err);
    } on DioError catch (e) {
      handler.next(e);
    } catch (e, s) {
      _log.error('Erro rest client', e, s);
      handler.next(err);
    } finally {
      _log.closeAppend();
    }
  }

  Future<void> _refreshToken(DioError err) async {
    final refreshToken =
        _localSecureStorage.read(Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY);

    if (refreshToken == null) {
      throw ExpireTokenException();
    }
    final resultRefresh = await _restClient.auth().post('/api/refresh');

    await _localStorage.write<String>(
      Constants.LOCAL_STORAGE_ACCESS_TOKEN_KEY,
      resultRefresh.data['authorisation']['token'],
    );

    await _localSecureStorage.write(
      Constants.LOCAL_STORAGE_REFRESH_TOKEN_KEY,
      resultRefresh.data['authorisation']['token'],
    );
  }

  Future<void> _retryRequest(
      DioError err, ErrorInterceptorHandler handler) async {
    _log.info('################## Retry Request ##################');
    final requestOptions = err.requestOptions;
    final result = await _restClient.request(
      requestOptions.path,
      method: requestOptions.method,
      data: requestOptions.data,
      headers: requestOptions.headers,
      queryParameters: requestOptions.queryParameters,
    );

    handler.resolve(
      Response(
        requestOptions: requestOptions,
        data: result.data,
        statusCode: result.statusCode,
        statusMessage: result.statusMessage,
      ),
    );
  }
}
