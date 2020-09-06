import 'package:flutter/material.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:mynewapp/Screens/Home/stars.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: _topbar(),
              ),
              SizedBox(
                height: size.height * .05,
              ),
              _leftIconcategoryBuilder(
                size: size,
                icon: Images.elephant,
                onTap: () {},
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
                    Navigator.pushNamed(context, 'lessonsMain');
                  },
                  buttonText: 'Learning Module',
                  descText: 'Learn more about chemistry',
                  color1: Colors.blue[400],
                  color2: Colors.blue[200]),
              _leftIconcategoryBuilder(
                size: size,
                icon: Images.giraffe,
                onTap: () {},
                buttonText: 'Lewis Structure Calculator',
                descText: 'Get your naming problem solve',
                color1: Colors.yellow[800],
                color2: Colors.yellow[600],
              ),
              _rightIconcategoryBuilder(
                  size: size,
                  icon: Images.hippo,
                  onTap: () {
                    Navigator.pushNamed(context, '/periodicTable');
                  },
                  buttonText: 'Interactive Periodic Table of Elements',
                  descText:
                      'a well-organized view of elements according to its properties and characteristics.',
                  color1: Colors.green[300],
                  color2: Colors.green[200]),
            ]),
          ),
        ),
      ),
    );
  }

  _topbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.sort),
          onPressed: () {},
          splashColor: Colors.blue,
        ),
        Text(
          'Elements++',
          style: GoogleFonts.indieFlower(
              fontSize: FontSizes.large, fontWeight: FontWeight.bold),
        ),
        ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
          ),
        ),
      ],
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
                padding: EdgeInsets.fromLTRB(120, 10, 10, 10),
                //margin: EdgeInsets.only(left: 20),
                width: size.width * .8,
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(buttonText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(descText,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ],
                ),
              ),
              Container(
                  width: size.width * .8,
                  height: size.height * .2,
                  child: FirstStars()),
              Positioned(
                left: -5,
                child: Container(
                  width: size.width * .4,
                  height: size.height * .28,
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
                width: size.width * .8,
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
                            fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    Flexible(
                      child: Text(descText,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 14)),
                    ),
                  ],
                ),
              ),
              Container(
                  width: size.width * .8,
                  height: size.height * .2,
                  child: SecondStars()),
              Positioned(
                right: -5,
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

  _buildStars({@required size}) {
    return Container(
      width: size.width * 0.02,
      height: size.height * 0.02,
      child: ShapeOfView(
        shape: StarShape(noOfPoints: 5),
      ),
    );
  }
}
