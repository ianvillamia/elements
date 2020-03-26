import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/signup.dart';
import 'package:mynewapp/Services/auth.dart';
import 'package:mynewapp/Shared/output.dart';
import 'package:mynewapp/Shared/animation.dart';
import 'package:mynewapp/Shared/loading.dart';

class Login extends StatefulWidget {
  final Function toggleView;
  Login({ this.toggleView });

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: FadeAnimation(1,
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 230.0,
                    child: Center(
                      child: Image.asset('assets/chemistry.png',
                          height: 230, fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Output().buildShadowText('Elements++', 30),
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
                        Center(
                          child:Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left:8),
                            hintText: 'Email',
                          ),
                          validator: (val) => val.isEmpty ? 'Enter your email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        TextFormField(
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 16, left: 8),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHidden ? Icon(Icons.visibility_off, size: 20) : Icon(Icons.visibility, size: 20),
                            ),
                          ),
                          validator: (val) => val.isEmpty ? 'Enter your password' : null,
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontFamily: 'OpenSans',
                                      fontSize: 14),
                                ),
                              ),
                              GestureDetector(
                                child: InkWell(
                                  child: Text(
                                    "Anonymous",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontFamily: 'OpenSans',
                                        fontSize: 14),
                                  ),
                                ),
                                onTap: () async {
                                dynamic result = await _auth.signInAnon();
                                  if (result == null) {
                                    print("Error signing in");
                                  } else {
                                    print("Signed in:");
                                    print(result);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                            width: 175,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color.fromRGBO(245, 47, 89, 100),
                              child: Center(
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()){
                                  setState(() => loading = true);
                                  dynamic result = await _auth.signin(email, password);
                                  print(result);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Invalid email or password';
                                      loading = false;
                                    });
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            horizontalLine(),
                            Text("Or"),
                            horizontalLine(),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            buildButton('assets/facebook.png', Colors.blueAccent),
                            SizedBox(width: 10),
                            buildButton('assets/google.png', Colors.grey[100]),
                          ],
                        ),
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "New User? ",
                              style: TextStyle(
                                fontFamily: 'OpenSans',
                              ),
                            ),
                            InkWell(
                              child: Text(
                                "Signup",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              onTap: () {
                                print('SignUp');
                                widget.toggleView();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: 40,
          height: 1.0,
          color: Colors.black26.withOpacity(.3),
        ),
      );

  buildButton(String loc, Color color) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      child: Image.asset(loc),
    );
  }
}
