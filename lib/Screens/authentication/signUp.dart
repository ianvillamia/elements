import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden1 = true;
  bool _isHidden2 = true;
  void _toggleVisibility1() {
    setState(() {
      _isHidden1 = !_isHidden1;
    });
  }

  void _toggleVisibility2() {
    setState(() {
      _isHidden2 = !_isHidden2;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
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
                Text('Sign up to get started!',
                    style: CustomTextStyles.customText(
                        color: Colors.grey, size: 25, isBold: true)),
                SizedBox(height: size.height * .05),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          labelText: 'First Name',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter your First name' : null,
                        onChanged: (val) {
                          //setState(() => email = val);
                        },
                      ),
                    ),
                    SizedBox(
                      width: size.width * .02,
                    ),
                    Flexible(
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(8.0),
                          labelText: 'Last Name',
                        ),
                        validator: (val) =>
                            val.isEmpty ? 'Enter your Last name' : null,
                        onChanged: (val) {
                          //setState(() => email = val);
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * .01),
                TextFormField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    labelText: 'Email',
                  ),
                  validator: (val) => val.isEmpty ? 'Enter your email' : null,
                  onChanged: (val) {
                    //setState(() => email = val);
                  },
                ),
                SizedBox(height: size.height * .01),
                TextFormField(
                  obscureText: _isHidden1,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                        onPressed: _toggleVisibility1,
                        icon: _isHidden1
                            ? Icon(Icons.visibility_off, size: 20)
                            : Icon(Icons.visibility, size: 20)),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Enter your password' : null,
                  onChanged: (val) {
                    //setState(() => email = val);
                  },
                ),
                SizedBox(height: size.height * .01),
                TextFormField(
                  obscureText: _isHidden2,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(8.0),
                    labelText: 'Confirm Password',
                    suffixIcon: IconButton(
                        onPressed: _toggleVisibility2,
                        icon: _isHidden2
                            ? Icon(Icons.visibility_off, size: 20)
                            : Icon(Icons.visibility, size: 20)),
                  ),
                  validator: (val) =>
                      val.isEmpty ? 'Confirm your password' : null,
                  onChanged: (val) {
                    //setState(() => email = val);
                  },
                ),
                SizedBox(height: size.height * .05),
                Center(
                  child: MaterialButton(
                    height: size.height * .075,
                    minWidth: size.width * .7,
                    //color: Color.fromRGBO(86, 43, 167, 1),
                    shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            BorderSide(color: Colors.purple[600], width: 2)),
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, letterSpacing: 7),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/lessonsMain');
                    },
                  ),
                ),
                SizedBox(height: size.height * .05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Already have an account? "),
                    InkWell(
                      child: Text(
                        "Sign in",
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/');
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
