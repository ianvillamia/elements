import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Models/user.dart';
import 'package:mynewapp/Screens/Authentication/landing.dart';
import 'package:mynewapp/Screens/Authentication/login.dart';
import 'package:mynewapp/Screens/Main/Menu/menu.dart';
import 'package:provider/provider.dart';
import 'package:mynewapp/Services/auth.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);
    
    // return either the Home or Authenticate widget
    if (user == null){
      return Login();
    } else {
      return Menu();
    }
    
  }
}