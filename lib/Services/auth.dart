import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mynewapp/Models/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj
  User _user(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _user(user));
        .map(_user);
  }

  //sign in anonymously

  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future SignInEmailAndPassword(String email, String password) async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return firebaseUser;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }
  //sign in email and password

  //register with email and password

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
