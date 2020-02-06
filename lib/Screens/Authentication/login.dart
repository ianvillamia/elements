import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
       child: Column(
         children: <Widget>[
           Container(
            height: 200.0,
            child: Center(
              child: Image.asset(
                'assets/chemistry.png', 
                width: 550, 
                height: 550,
                fit: BoxFit.fitHeight),
            ),
           ),
           Container(
             alignment: Alignment.centerLeft,
             child:Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                'Elements++',
                textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                    shadows: [
                      Shadow(
                          blurRadius: 3.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 5.0),
                          ),
                    ],
                  ),
              ),
              Text(
                'Sign in to continue',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                ),
              )
             ],),
           ),
           Container(
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
              contentPadding: EdgeInsets.all(10),
              hintText: 'Enter your Email',
             ),
             
            ),
             
           ),
           
         ],
         ),
    );
  }
}