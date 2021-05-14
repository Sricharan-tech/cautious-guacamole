import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ENStoresFirebaseUser {
  ENStoresFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

ENStoresFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<ENStoresFirebaseUser> eNStoresFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<ENStoresFirebaseUser>(
            (user) => currentUser = ENStoresFirebaseUser(user));
