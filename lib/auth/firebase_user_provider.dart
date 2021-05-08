import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class EducationariesAppFirebaseUser {
  EducationariesAppFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

EducationariesAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<EducationariesAppFirebaseUser> educationariesAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<EducationariesAppFirebaseUser>(
            (user) => currentUser = EducationariesAppFirebaseUser(user));
