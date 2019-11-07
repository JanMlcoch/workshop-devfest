import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:core/core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

class MobileAuthService implements AuthService {
  @override
  void init() {
    FirebaseAuth.instance.onAuthStateChanged.listen(_user.add);
  }

  @override
  Future<void> authenticate() async {
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    Firestore.instance.collection('users').document(user.uid).setData({
      'name': user.displayName,
      'email': user.email,
    }, merge: true);
  }

  @override
  Stream<String> get currentUserId => _user.map((u) => u?.uid);

  final BehaviorSubject<FirebaseUser> _user = BehaviorSubject.seeded(null);
}
