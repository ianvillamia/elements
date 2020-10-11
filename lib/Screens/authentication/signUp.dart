import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Global/spinner.dart';
import 'package:mynewapp/Models/UserModel.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Strings/routes.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isHidden1 = true;
  bool _isHidden2 = true;
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController(),
      passwordController = TextEditingController(),
      confirmPasswordController = TextEditingController(),
      firstNameController = TextEditingController(),
      lastNameController = TextEditingController();
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
    return isLoading
        ? Spinner()
        : Scaffold(
            body: Form(
              key: _formKey,
              child: Container(
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
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        Text('Please register to get started!',
                            style: CustomTextStyles.customText(
                                color: Colors.grey, size: 19, isBold: true)),
                        SizedBox(height: size.height * .05),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: TextFormField(
                                controller: firstNameController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(8.0),
                                  labelText: 'First Name',
                                ),
                                validator: (val) => val.isEmpty
                                    ? 'Enter your First name'
                                    : null,
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
                                controller: lastNameController,
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
                          controller: emailController,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(8.0),
                            labelText: 'Email',
                          ),
                          validator: (val) =>
                              val.isEmpty ? 'Enter your email' : null,
                          onChanged: (val) {
                            //setState(() => email = val);
                          },
                        ),
                        SizedBox(height: size.height * .01),
                        TextFormField(
                          controller: passwordController,
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
                        ),
                        SizedBox(height: size.height * .01),
                        TextFormField(
                          autovalidate: true,
                          controller: confirmPasswordController,
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
                          validator: (val) {
                            if (val != passwordController.text || val == null) {
                              return 'passwords dont match';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: size.height * .05),
                        Center(
                          child: MaterialButton(
                            height: size.height * .075,
                            minWidth: size.width * .7,
                            //color: Color.fromRGBO(86, 43, 167, 1),
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Register',
                                style: CustomTextStyles.customText(
                                    size: 27, color: Colors.blue),
                              ),
                            ),
                            onPressed: () {
                              //if passwords match

                              if (_formKey.currentState.validate()) {
                                setState(() => isLoading = true);
                                UserModel user = UserModel();
                                user.firstName =
                                    firstNameController.text.trim();
                                user.lastName = lastNameController.text.trim();
                                user.email = emailController.text.trim();
                                context
                                    .read<AuthenticationService>()
                                    .signUp(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        user: user)
                                    .then((value) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      '/', (Route<dynamic> route) => false);
                                }).catchError((error) {
                                  setState(() {
                                    isLoading = false;
                                  });
                                });
                              }
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
                                Navigator.pushNamed(context, Routes.def);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
