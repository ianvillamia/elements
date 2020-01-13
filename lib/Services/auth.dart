import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  //sign in anonymously
  Future signInAnon() async {
    try {
      AuthResult result =
          await _auth.signInAnonymously(); //this function returns auth result
      FirebaseUser user = result.user; //save the userinfo from result to "user"
      return user;
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  Future<void> googleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
