import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mynewapp/Models/UserModel.dart';

class UserService {
  static addUserToCollection({UserModel user}) {
    FirebaseFirestore.instance.collection('users').add(user.toMap());
  }
}
