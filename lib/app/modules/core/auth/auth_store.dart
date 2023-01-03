import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/local_storage/local_storage.dart';
import '../../../models/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final LocalStorage _localStorage;

  AuthStoreBase({required LocalStorage localStorage})
      : _localStorage = localStorage;

  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    // Usuário logado
    final userModelJson = await _localStorage
        .read<String>(Constants.LOCAL_STORAGE_USER_LOGGED_DATA);
    if (userModelJson != null) {
      _userLogged = UserModel.fromJson(userModelJson);
    } else {
      _userLogged = UserModel.empty();
    }

    // Usuário Deslogado
    FirebaseAuth.instance.authStateChanges().listen(
      (user) async {
        if (user == null) {
          await logout();
        }
      },
    );
  }

  @action
  Future<void> logout() async {
    await _localStorage.clear();
    _userLogged = UserModel.empty();
  }
}
