import 'package:flutter/material.dart';

import 'Screens/Authentication/login.dart';

void main() => runApp(MaterialApp(
      //home:Login(), 
     // home:SignUp(),
     home: Scaffold(
        body: Login()
       ),
      //home:LandingPage(),
      debugShowCheckedModeBanner: false,
    ));
