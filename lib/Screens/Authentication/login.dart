import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/output.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

buildButton(String loc,Color color){
    return  Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: color
                      ),
                      child: Image.asset(loc),
                    );
  }
class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
       child: Column(
         children: <Widget>[
           Container(
            height: 250.0,
            child: Center(
              child: Image.asset(
                'assets/chemistry.png',  
                height: 250,
                fit: BoxFit.cover),
            ),
           ),
           Container(
             alignment: Alignment.centerLeft,
             child:Column (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Output().buildShadowText('Elements++',30),
                Text(
                  'Sign in to continue',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'OpenSans',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter your Email',
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    hintText: 'Enter your Password',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Center(
                  child:Container(
                    width: 175,
                    child: MaterialButton(
                    
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      color: Color.fromRGBO(245, 47, 89, 100),
                      child: Center(
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Sign up with"
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                 buildButton('assets/facebook.png',Colors.blueAccent),
                  SizedBox(
                    width: 10
                  ),
                buildButton('assets/google.png',Colors.white70),
                ],)
                
              ],),
           ),
         ],
         ),
    );
  }
}