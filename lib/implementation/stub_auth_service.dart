import 'package:core/core.dart';
import 'package:rxdart/rxdart.dart';

class StubAuthService extends AuthService {
  BehaviorSubject<String> _userId = BehaviorSubject.seeded(null);

  @override
  Future<void> authenticate() async {
    _userId.add('USER');
  }

  @override
  Stream<String> get currentUserId => _userId.stream;

  @override
  void init() {}
}
