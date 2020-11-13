import 'package:flutter/cupertino.dart';
import 'package:mynewapp/Models/UserModel.dart';

class AppProvider extends ChangeNotifier {
  UserModel user;
  AppProvider({@required UserModel userModel}) {
    this.user = userModel;
  }
}
