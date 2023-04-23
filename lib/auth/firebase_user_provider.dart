import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MiitFirebaseFirebaseUser {
  MiitFirebaseFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MiitFirebaseFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MiitFirebaseFirebaseUser> miitFirebaseFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MiitFirebaseFirebaseUser>(
      (user) {
        currentUser = MiitFirebaseFirebaseUser(user);
        return currentUser!;
      },
    );
