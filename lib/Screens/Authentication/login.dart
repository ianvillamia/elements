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
            height: 250.0,
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage('assets/chemistry.png'),
                 fit: BoxFit.fill
               )
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
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                ),
              )
             ],)
           )
           
         ],
         ),
    );
  }
}