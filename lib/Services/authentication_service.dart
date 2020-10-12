import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Models/UserModel.dart';
import 'package:mynewapp/Services/userService.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;
  AuthenticationService(this._firebaseAuth);
  Stream<User> get authStateChanges => _firebaseAuth.authStateChanges();
  UserService _userService = UserService();
  Future<String> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return 'Signed in';
    } on FirebaseAuthException catch (e) {
      return Future.error(e.message);
    }
  }

  Future<String> signUp(
      {@required String email,
      @required String password,
      @required UserModel user}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      await _userService.addUserToCollection(user: user);
      return 'Signed Up';
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> passwordReset({@required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }
}
