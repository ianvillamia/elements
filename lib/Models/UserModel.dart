import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String firstName = '';
  String lastName = '';
  String email = '';
  String ref = '';

  toMap() {
    return {'firstName': this.firstName, 'lastName': this.lastName, 'ref': ref};
  }
}
