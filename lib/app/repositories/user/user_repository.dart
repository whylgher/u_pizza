abstract class UserRepository {
  Future<void> register(
      String email, String password, String name, String phone);
  Future<String> login(String email, String password);
}
