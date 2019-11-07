import 'package:core/core.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart';
import 'package:rxdart/rxdart.dart';

class WebAuthService implements AuthService {
  @override
  void init() {
    auth().onAuthStateChanged.listen(_user.add);
  }

  @override
  Future<void> authenticate() async {
    final provider = GoogleAuthProvider();
    await _doLogin(provider);
  }

  @override
  Stream<String> get currentUserId => _user.map((u) => u?.uid);

  final BehaviorSubject<User> _user = BehaviorSubject.seeded(null);

  Future<void> _doLogin(AuthProvider provider) async {
    try {
      final result = await auth().signInWithPopup(provider);

      await firestore().collection('users').doc(result.user.uid).set(
        {
          'name': result.user.displayName,
          'email': result.user.email,
        },
        SetOptions(merge: true),
      );
    } catch (e) {
      print(e);
    }
  }
}
