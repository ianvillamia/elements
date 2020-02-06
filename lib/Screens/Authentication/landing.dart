import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(children: <Widget>[
        SizedBox(
          height: 50,
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
                Text(
                  'Let\'s get',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'OpenSans',
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 3.0),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Started',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'OpenSans',
                    shadows: [
                      Shadow(
                        color: Colors.grey,
                        offset: Offset(2.0, 3.0),
                      ),
                    ],
                  ),
                ),
              ])),
        ),
        SizedBox(height:20),
        Container(
          height: 300,
          color: Colors.red,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -30,
                right: -70,
                child: Container(
                  height: 300,
                  color: Colors.teal,
                  child: Image.asset('assets/chemist.png',fit: BoxFit.contain,),
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
