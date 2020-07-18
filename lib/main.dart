import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Models/user.dart';
import 'package:mynewapp/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:mynewapp/Services/auth.dart';
import 'package:mynewapp/Screens/Authentication/landing.dart';


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
        debugShowCheckedModeBanner: false,
       // home: PeriodicTable(),
        home: TestSplash(),
       // home: Wrapper(),
      ),
    );
  }
}