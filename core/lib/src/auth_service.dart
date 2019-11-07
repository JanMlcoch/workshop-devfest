abstract class AuthService {
  Stream<String> get currentUserId;

  Future<void> authenticate();

  void init();
}
