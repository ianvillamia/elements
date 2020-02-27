import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/output.dart';
import 'package:mynewapp/Shared/animation.dart';
class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FadeAnimation(
                  1,SingleChildScrollView(
            child: Padding(
            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 250.0,
                  child: Center(
                    child: Image.asset(
                      'assets/compound-simulation.jpg',  
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
                        'Sign up to continue',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'OpenSans',
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 125,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'First Name',
                              ),
                            ),
                          ),

                          Container(
                            width: 125,
                            child: TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: 'LastName Name',
                              ),
                            ),
                          ),
                        ],
                      ),
                      TextField(
                        
                        obscureText: _obscureText,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'Email',
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            width: 125,
                            child: TextField(
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                // suffixIcon: GestureDetector(
                                //   onTap: () {
                                //     setState(() {
                                //       _obscureText = !_obscureText;
                                //     });
                                //   },
                                //   child: Icon(
                                //     _obscureText ? Icons.visibility : Icons.visibility_off,
                                //   ),
                                // ),
                              ),
                            ),
                          ),

                          Container(
                            width: 125,
                            child: TextField(
                              obscureText: _obscureText,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
                                // suffixIcon: GestureDetector(
                                //   onTap: () {
                                //     setState(() {
                                //       _obscureText = !_obscureText;
                                //     });
                                //   },
                                //   child: Icon(
                                //     _obscureText ? Icons.visibility : Icons.visibility_off,
                                //   ),
                                // ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: <Widget>[
                      //     InkWell(
                      //       child: Text(
                      //         "Forgot Password?",
                      //         style: TextStyle(
                      //           color: Colors.blue,
                      //           fontFamily: 'OpenSans',
                      //           fontSize:14
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child:Container(
                          width: 175,
                          child: MaterialButton(
                          
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            color: Color.fromRGBO(245, 47, 89, 100),
                            child: Center(
                              child: Text(
                                'Sign up',
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
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          horizontalLine(),
                          Text(
                            "Or"
                          ),
                          horizontalLine(),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                        buildButton('assets/facebook.png',Colors.blueAccent),
                          SizedBox(
                            width: 10
                          ),
                        buildButton('assets/google.png',Colors.grey[100]),
                        ],
                      ),
                    ]
                   ),
                )
              ]
            ),
          ),
      ),
        ),
    );
  }
  horizontalLine() => 
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Container(
        width: 40,
        height: 1.0,
        color: Colors.black26.withOpacity(.3),
      ),
  );

  buildButton(String loc,Color color){
    return  Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color
      ),
      child: Image.asset(loc),
    );
  }
}