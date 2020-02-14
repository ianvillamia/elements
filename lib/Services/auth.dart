import 'package:firebase_auth/firebase_auth.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
 
 final FirebaseAuth _auth=FirebaseAuth.instance;

  //sign in anonymously
  Future signInAnon(String email,String password) async{
    try{
      AuthResult authResult=await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser firebaseUser = authResult.user;
      return firebaseUser;
    }
    catch(err){
      print(err.toString());
      return null;
    }
  }  
  //sign in email and password
  //register with email and password
  //sign out

}
