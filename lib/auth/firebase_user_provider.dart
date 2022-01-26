import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MesukdeeFirebaseUser {
  MesukdeeFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

MesukdeeFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MesukdeeFirebaseUser> mesukdeeFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MesukdeeFirebaseUser>(
            (user) => currentUser = MesukdeeFirebaseUser(user));
