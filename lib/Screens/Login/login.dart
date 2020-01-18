import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../Services/auth.dart';
class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  bool _isSelected = false;

  void _radio() {
    setState(() {
      _isSelected = !_isSelected;
    });
  }

  Widget radioButton(bool isSelected) => Container(
        width: 16.0,
        height: 16.0,
        padding: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 2.0, color: Colors.black),
        ),
        child: isSelected
            ? Container(
                width: double.infinity,
                height: double.infinity,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
              )
            : Container(),
      );

  Widget horizontalLine() => Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          width: ScreenUtil.getInstance().setWidth(120),
          height: 1.0,
          color: Colors.black26.withOpacity(.2),
        ),
      );

  @override
  Widget build(BuildContext context) {

    final AuthService _auth = AuthService();

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);
    ScreenUtil.instance =
        ScreenUtil(width: 750, height: 1334, allowFontScaling: true);

    return new Scaffold(
      drawer: Drawer(child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Header'),
            decoration: BoxDecoration(
              color: Colors.blue
            ),
          ),
          ListTile(
            title: Text('Item'),
            onTap: (){},
          )
        ],
      ),),
      
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                "assets/background.jpg",
                fit: BoxFit.cover,
                height: ScreenUtil.getInstance().setHeight(1330),
                width: ScreenUtil.getInstance().setWidth(800),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.0, right: 28.0, top: 60.0),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(180),
                ),
                buildCard(_auth),
                SizedBox(
                  height: ScreenUtil.getInstance().setHeight(150),
                ),
                buildFooter()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Row buildFooter() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Text(
        "New User? ",
        style: TextStyle(fontFamily: "Poppins-Medium"),
      ),
      InkWell(
        onTap: () {
          //signup
        },
        child: Text(
          "Signup",
          style: TextStyle(
            color: Color(0xFF5d74e3),
            fontFamily: "Poppins-Bold",
          ),
        ),
      )
    ],
  );
}

Container buildCard(auth) {
  return Container(
    margin: EdgeInsets.fromLTRB(0, 40, 0, 90),
    width: double.infinity,
    height: ScreenUtil.getInstance().setHeight(550),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, 15.0),
              blurRadius: 15.0),
          BoxShadow(
              color: Colors.black12,
              offset: Offset(0.0, -10.0),
              blurRadius: 10.0),
        ]),
    child: Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
                fontSize: ScreenUtil.getInstance().setSp(45),
                fontFamily: "Poppins-Bold",
                letterSpacing: .6),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),
          TextField(
            decoration: InputDecoration(
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(30),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12.0)),
          ),
          SizedBox(
            height: ScreenUtil.getInstance().setHeight(35),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width: ScreenUtil.getInstance().setWidth(330),
                  height: ScreenUtil.getInstance().setHeight(100),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.pink[50], Colors.blue[300]]),
                      borderRadius: BorderRadius.circular(6.0),
                      boxShadow: [
                        BoxShadow(
                            color: Color(0xFF6078ea).withOpacity(.3),
                            offset: Offset(0.0, 8.0),
                            blurRadius: 8.0)
                      ]),

                  child: MaterialButton(
                    //   onPressed: (){},
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          print('object');
                        },
                        child: Center(
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Poppins-Bold",
                                fontSize: 18,
                                letterSpacing: 1.0),
                          ),
                        )),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  print('igit');
                },
                child: Text("Forgot Password?",
                    style: TextStyle(
                        fontSize: 12, fontFamily: "Poppins-Medium")),
              ),
              GestureDetector(
                onTap: () async{
                  dynamic result = await auth.signInAnon;
                  if(result==null){print('error Sign in');}
                  else{
                    print('Signed in');
                    print(result);
                  }
                },child: Text('Anonymous'),
              ),
            Text(
            "Forgot Password?",
            style: TextStyle(
                color: Colors.blue,
                fontFamily: "Poppins-Medium",
                fontSize: ScreenUtil.getInstance().setSp(28)),
          ), ],
          ),
        ],
      ),
    ),
  );
}
