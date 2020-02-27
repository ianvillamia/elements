import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/design.dart';
import 'package:mynewapp/Screens/Authentication/login.dart';
import '../../Shared/output.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.fill,
                )),
            Text(
              'Elements++',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontSize: 22,
                fontWeight: FontWeight.bold,
                fontFamily: 'OpenSans',
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(left: 60),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Column(children: <Widget>[
                  Output().buildShadowText('Lets get', 40),
                  Output().buildShadowText('Started', 40),
                ])),
          ),
          SizedBox(height: 20),
          Container(
            height: 280,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Positioned(
                  left: 100,
                  top: 80,
                    child:Design().buildCircle(30, 30, 224, 224, 224, 100)),
                       Positioned(
                  left: 130,
                  top: 120,
                    child:Design().buildCircle(40, 40, 224, 224, 224, 100)),
                      Positioned(
                  left: 90,
                  top: 170,
                    child:Design().buildCircle(60,60, 224, 224, 224, 100)),
                Positioned(
                    top: 10,
                    left: 80,
                    child: MaterialButton(
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Text(
                        'Go',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      onPressed: () {
                        print('Go');
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
                      },
                      color: Colors.redAccent,
                    )),
                Positioned(
                  top: -30,
                  right: -70,
                  child: Container(
                    height: 300,
                    child: Image.asset(
                      'assets/chemist.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
 
}
