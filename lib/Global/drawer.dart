import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Screens/Game/protoGame.dart';
import 'package:mynewapp/Screens/Home/stars.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class BuildDrawer extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Elements++',
                style: GoogleFonts.indieFlower(
                    fontSize: FontSizes.heading, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: size.height * .03,
            ),
            _leftIconcategoryBuilder(
              size: size,
              icon: Images.elephant,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProtoGame(),
                    ));
              },
              buttonText: 'Compound Simulation',
              descText:
                  'Learn organic compounds through this  simulation game.',
              color1: Colors.deepPurple[300],
              color2: Colors.deepPurple[200],
            ),
            _rightIconcategoryBuilder(
                size: size,
                icon: Images.owl,
                onTap: () {
                  Navigator.pushNamed(context, '/lessonsMain');
                },
                buttonText: 'Learning Module',
                descText: 'Learn more about chemistry',
                color1: Colors.blue[400],
                color2: Colors.blue[200]),
            _leftIconcategoryBuilder(
              size: size,
              icon: Images.hippo,
              onTap: () {},
              buttonText: 'Lewis Structure Calculator',
              descText: 'Get your naming problem solve',
              color1: Colors.yellow[800],
              color2: Colors.yellow[600],
            ),
            _rightIconcategoryBuilder(
                size: size,
                icon: Images.giraffe,
                onTap: () {
                  Navigator.pushNamed(context, '/periodicTable');
                },
                buttonText: 'Interactive Periodic Table of Elements',
                descText:
                    'a well-organized view of elements according to its properties and characteristics.',
                color1: Colors.green[300],
                color2: Colors.green[200]),
          ]),
        ],
      ),
    );
  }

  _leftIconcategoryBuilder(
      {@required size,
      @required String icon,
      @required onTap,
      @required String buttonText,
      @required String descText,
      @required Color color1,
      color2}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: size.height * .28,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(105, 10, 10, 10),
                //margin: EdgeInsets.only(left: 20),
                width: size.width * .72,
                height: size.height * .2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [color1, color2],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.65]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(buttonText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(descText,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              Container(
                  width: size.width * .72,
                  height: size.height * .2,
                  child: Stars()),
              Positioned(
                left: -8,
                child: Container(
                  width: size.width * .35,
                  height: size.height * .23,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(icon), fit: BoxFit.contain)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _rightIconcategoryBuilder(
      {@required size,
      @required String icon,
      @required onTap,
      @required String buttonText,
      @required String descText,
      @required Color color1,
      color2}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: size.height * .28,
          width: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(30, 10, 90, 10),
                //margin: EdgeInsets.only(left: 20),
                width: size.width * .72,
                height: size.height * .2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [color1, color2],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [0.2, 0.65]),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(3, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(buttonText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(descText,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ),
                  ],
                ),
              ),
              Container(
                  width: size.width * .72,
                  height: size.height * .2,
                  child: Stars()),
              Positioned(
                right: -10,
                child: Container(
                  width: size.width * .35,
                  height: size.height * .28,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(icon))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
