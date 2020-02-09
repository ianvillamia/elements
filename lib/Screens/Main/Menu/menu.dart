import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mynewapp/Shared/appbar.dart';
import 'package:mynewapp/Shared/drawer.dart';
import 'package:mynewapp/Shared/bottomNavigation.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class _MenuState extends State<Menu> {
  PageController pageController;
  int current = 0;
  List images = [
    "assets/.png",
    "assets/compound-simulation.jpg",
    "assets/periodic-table.png"
  ];
  List name = ["Learning Module", "Compound Simulation", "Periodic Table"];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        key: _scaffoldKey,
        bottomNavigationBar: buildBottomNavigation(),
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 15,
                  ),
                  buildappbar(context, _scaffoldKey),
                  Stack(
                    children: <Widget>[

                      Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                      color: Colors.lightBlue,
                      ),
                      Container(
                      child: Container(height: 400, child: test()),
                    ),
                    ],
                                
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  test() {
    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      itemBuilder: (context, position) {
        return _carousel(position);
      },
    );
  }

  _carousel(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        double value = 1;
        if (pageController.position.haveDimensions) {
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Container(
          child: Container(
            height: 300,
            child: widget,
          ),
        );
      },
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            width: 400,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.grey[400]),
                image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.fill)),
          ),
          Center(
            child: Text(
              name[index],
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CuteFont'),
            ),
          ),
        ],
      ),
    );
  }
}
