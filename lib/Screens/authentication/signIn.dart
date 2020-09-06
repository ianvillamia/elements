import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isHidden = true;
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(30, 40, 30, 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Elements++',
                  style: GoogleFonts.indieFlower(
                      fontSize: 50, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: size.height * .05,
                ),
                Text(
                  'Welcome,',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text('Sign in to continue!',
                    style: CustomTextStyles.customText(
                        color: Colors.grey, size: 25, isBold: true)),
                SizedBox(height: size.height * .05),
                TextFormField(
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(8.0),
                      labelText: 'Email'),
                ),
                SizedBox(height: size.height * .02),
                TextFormField(
                  obscureText: _isHidden,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: _toggleVisibility,
                        icon: _isHidden
                            ? Icon(Icons.visibility_off, size: 20)
                            : Icon(Icons.visibility, size: 20)),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Enter your password' : null,
                ),
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text('Forgot Password?',
                            style: TextStyle(color: Colors.blue))
                      ]),
                ),
                SizedBox(height: size.height * .03),
                Center(
                  child: MaterialButton(
                    height: size.height * .075,
                    minWidth: size.width * 0.7,
                    //color: Color.fromRGBO(86, 43, 167, 1),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Colors.purple[600], width: 2)),
                    child: Text(
                      'SIGN IN',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 7),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                  ),
                ),
                SizedBox(height: size.height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account? "),
                    InkWell(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/signUp');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
