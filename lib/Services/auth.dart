import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  
}
