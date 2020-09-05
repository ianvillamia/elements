import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/authentication/signIn.dart';
import 'package:mynewapp/Services/routing.dart';
import 'package:mynewapp/Strings/routes.dart';

void main() {
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //setup fluro
      onGenerateRoute: FluroRouter.router.generator,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.lessonsMain,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),

      home: SignIn(),
    );
  }
}
