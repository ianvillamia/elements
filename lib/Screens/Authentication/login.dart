import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/output.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {
  @override

  Widget horizontalLine() => 
  Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    child: Container(
      width: 50,
      height: 1.0,
      color: Colors.black26.withOpacity(.3),
    ),
  );

  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.fromLTRB(40, 30, 40, 10),
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
                Output().buildShadowText('Elements++'),
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
                  height: 10,
                ),
                Center(
                  child:Container(
                    width: 260,
                    child: MaterialButton(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    horizontalLine(),
                    Text(
                      "Sign up with"
                    ),
                    horizontalLine(),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(8, 18, 77, 100)
                      ),
                      child: Image.asset('assets/facebook.png'),
                    ),
                    SizedBox(
                      width: 30
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(255, 79, 56, 50)
                      ),
                      child: Image.asset('assets/google.png'),
                    ),
                  ],))
                
              ],),
           ),
         ],
         ),
    );
  }
}