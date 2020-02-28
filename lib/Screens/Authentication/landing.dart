import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Authentication/login.dart';
import 'package:mynewapp/Screens/Main/Menu/menu.dart';
import '../../Shared/output.dart';
import 'package:mynewapp/Global/sizes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynewapp/Shared/animation.dart';
import 'package:provider/provider.dart';
import 'package:mynewapp/Models/user.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //getting data
    final user = Provider.of<User>(context);
    print(user);
    ScreenUtil.init(context);
    Size().init(context);
    if (user == null) {
      return SingleChildScrollView(
        child: Column(children: <Widget>[
          FadeAnimation(
            1,
            Container(
              height: ScreenUtil().setHeight(1100),
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 200,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(241, 161, 161, 1),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius:
                                  5, // has the effect of softening the shadow
                              offset: Offset(
                                5, // horizontal, move right 10
                                5.0, // vertical, move down 10
                              ),
                            )
                          ],
                        ),
                        height: ScreenUtil().setHeight(420),
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        child: Center(
                          child: Column(children: <Widget>[
                            SizedBox(
                              height: 25,
                            ),
                            Output().buildShadowText('Lets get', 45),
                            Output().buildShadowText('Started', 45),
                          ]),
                        )),
                  ),
                  Positioned(
                    top: 0,
                    left: 60,
                    child: FadeAnimation(
                      1,
                      Container(
                          height: ScreenUtil().setHeight(750),
                          width: ScreenUtil().setHeight(750),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            //  color: Colors.pink
                          ),
                          child: Image.asset(
                            'assets/new_logo.png',
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          FadeAnimation(
            1,
            Container(
              height: 280,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 100,
                      top: 80,
                      child: buildCircle(30, 30, 253, 86, 86, 1, 2)),
                  Positioned(
                      left: 130,
                      top: 120,
                      child: buildCircle(40, 40, 215, 218, 63, 1, 2.01)),
                  Positioned(
                      left: 90,
                      top: 170,
                      child: buildCircle(60, 60, 233, 45, 45, 1, 2.2)),
                  Positioned(
                    top: -30,
                    right: -70,
                    child: FadeAnimation(
                      1,
                      Container(
                        height: 300,
                        child: Image.asset(
                          'assets/chemist.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    child: GestureDetector(
                      child: Container(
                        color: Colors.tealAccent,
                        width: 200,
                        height: 50,
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Text(
                            'Go',
                            style: TextStyle(color: Colors.white, fontSize: 45),
                          ),
                          onPressed: () {
                            print('Go');
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          color: Color.fromRGBO(245, 47, 89, 1),
                        ),
                      ),
                      onTap: () {
                        print('Go');
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      );
    } else {
      return Menu();
    }
  }

  buildCircle(double w, double h, int r, int g, int b, double o, double delay) {
    return FadeAnimation(
      delay,
      Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
            shape: BoxShape.circle, color: Color.fromRGBO(r, g, b, o)),
      ),
    );
  }
}
