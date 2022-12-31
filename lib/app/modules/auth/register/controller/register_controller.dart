import 'package:mobx/mobx.dart';

import '../../../../core/exception/user_exists_exception.dart';
import '../../../../core/ui/widgets/loader.dart';
import '../../../../core/ui/widgets/messages.dart';

abstract class RegisterControllerBase with Store {

  Future<void> register(
      {required String email, required String password}) async {
    Loader.show();
    await Future.delayed(const Duration(seconds: 2));
    Loader.hide();
    try {
      Loader.show();
      // await _userService.register(email, password);
      Loader.hide();
    } on UserExistsException {
      Loader.hide();
      Messages.alert('Email já utilizado');
    } catch (e, s) {
      // _log.error('Erro ao registar usuário', e, s);
      Loader.hide();
      Messages.alert('Erro ao registar usuário');
    }
  }
}