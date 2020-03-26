import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/login.dart';
import 'package:mynewapp/Services/auth.dart';
import 'package:mynewapp/Shared/output.dart';
import 'package:mynewapp/Shared/animation.dart';
import 'package:mynewapp/Shared/textFormField.dart';
import 'package:mynewapp/Shared/loading.dart';

class Signup extends StatefulWidget {
  
  final Function toggleView;
  Signup({ this.toggleView });

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isHidden = true;
  bool _isHiddenn = true;
  bool loading = false;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _toggleVisibilityy() {
    setState(() {
      _isHiddenn = !_isHiddenn;
    });
  }
  

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  

  //values
  String firstname = '';
  String lastname = '';
  String email = '';
  String password = '';
  String confirmpassword = '';
  String error = '';
  
  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      body: FadeAnimation(
        1,
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
              child: Column(children: <Widget>[
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
                          'Sign up to continue',
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 125,
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(hintText: 'First Name'),
                                validator: (val) => val.isEmpty ? 'Enter Firstname' : null,
                                onChanged: (val) {
                                  setState(() => firstname = val);
                                },
                              ),
                            ),
                            Container(
                              width: 125,
                              child: TextFormField(
                                decoration: textInputDecoration.copyWith(hintText: 'Last Name'),
                                validator: (val) => val.isEmpty ? 'Enter Lastname' : null,
                                onChanged: (val) {
                                  setState(() => lastname = val);
                                },
                              ),
                            ),
                          ],
                        ),
                        TextFormField(
                          decoration: textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) => val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                        ),
                        TextFormField(
                          controller: _pass,
                          obscureText: _isHiddenn,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 16),
                            hintText: 'Password',
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibilityy,
                              icon: _isHiddenn ? Icon(Icons.visibility_off, size: 20) : Icon(Icons.visibility, size: 20),
                            ),
                          ),
                          validator: (val) {
                            if(val.length < 8)
                              return "Your password must be at least 6 characters long.";
                            else if(val.isEmpty)
                              return 'Enter your password';
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => password = val);
                          },
                        ),
                        SizedBox(height: 5),
                        Text('(Use 8 or more characters)'),
                        TextFormField(
                          controller: _confirmPass,
                          obscureText: _isHidden,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 16),
                            hintText: 'Confirm Password',
                            suffixIcon: IconButton(
                              onPressed: _toggleVisibility,
                              icon: _isHidden ? Icon(Icons.visibility_off, size: 20) : Icon(Icons.visibility, size: 20),
                            ),
                          ),
                          validator: (val) {
                            if(val != _pass.text)
                              return "Password didn't match. Try again!";
                            return null;
                          },
                          onChanged: (val) {
                            setState(() => confirmpassword = val);
                          },
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
                                  'Sign up',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() => loading = true);
                                  dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                  if (result == null) {
                                    setState(() {
                                      error = 'Please enter a valid email';
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
                            buildButton(
                                'assets/facebook.png', Colors.blueAccent),
                            SizedBox(width: 10),
                            buildButton('assets/google.png', Colors.grey[100]),
                          ],
                        ),
                        InkWell(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              onTap: () {
                                print('Login');
                                widget.toggleView();
                              },
                            )
                      ]),
                )
              ]),
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
