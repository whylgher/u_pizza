import 'package:firebase_auth/firebase_auth.dart';

import './user_service.dart';
import '../../core/exception/failure.dart';
import '../../core/exception/user_exists_exception.dart';
import '../../core/logger/app_logger.dart';
import '../../repositories/user/user_repository.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final AppLogger _log;

  UserServiceImpl({
    required UserRepository userRepository,
    required AppLogger log,
  })  : _userRepository = userRepository,
        _log = log;

  @override
  Future<void> register(
      String email, String password, String name, String phone) async {
    try {
      final firebaseAuth = FirebaseAuth.instance;

      final userLoggedMethods =
          await firebaseAuth.fetchSignInMethodsForEmail(email);

      if (userLoggedMethods.isNotEmpty) {
        throw UserExistsException();
      }

      await _userRepository.register(email, name, password, phone);

      final userRegisterCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      await userRegisterCredential.user?.sendEmailVerification();
    } on FirebaseException catch (e, s) {
      _log.error('Erro ao criar usuário no Firebase', e, s);
      throw Failure(message: 'Erro ao criar usuário.');
    }
  }

  @override
  Future<void> login(String email, String password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<void> socialLogin(socialLoginType) {
    // TODO: implement socialLogin
    throw UnimplementedError();
  }
}
