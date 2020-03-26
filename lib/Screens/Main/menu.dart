import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mynewapp/Shared/appbar.dart';
import 'package:mynewapp/Shared/drawer.dart' as drawer;
import 'package:mynewapp/Shared/bottomNavigation.dart';
import 'package:mynewapp/Services/auth.dart';
class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}


class _MenuState extends State<Menu> {
  PageController pageController;
  int current = 0;
  List images = [
    "assets/learning-module.jpg",
    "assets/compound-simulation.jpg",
    "assets/periodic-table.jpg"
  ];
  List name = ["Learning Module", "Compound Simulation", "Periodic Table"];

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
      backgroundColor: Colors.white,
      //key: _scaffoldKey1,
      bottomNavigationBar: buildBottomNavigation(),
      drawer:Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //image
                  
                  //name
                  Text("Emma Watson"),
                  //email
                  Text("emmaWatson@gmail.com")
                ],
              ),
              decoration: BoxDecoration(color: Colors.redAccent),
            ),
            ListTile(
              title: Container(
                alignment: Alignment.topLeft,
                height: 100,
                color: Colors.redAccent,
                child: Column(
                  children: <Widget>[],
                ),
              )
            ),
            ListTile(
              title: Text("Item 2"),
              trailing: Icon(Icons.arrow_forward),
            ),
            ListTile(
              title: MaterialButton(
                color: Colors.redAccent,
                onPressed: () async{
                  await AuthService().signOut();
                },
                child: Text('data'),
              )
            )
          ],
        )
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                // buildappbar(context, _scaffoldKey1),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                      child:welcome()
                    ),
                    
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Stack(
                  children: <Widget>[
                    Container(
                      height: 260,
                      width: MediaQuery.of(context).size.width,
                      color: Color.fromRGBO(252, 180, 180, 100),
                    ),
                    Container(
                      child: Container(
                        height: 280, 
                        child: test()
                      ),
                    ),
                  ],
                ),
                InkWell(
                              child: Text(
                                "Logout",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontFamily: 'OpenSans',
                                ),
                              ),
                              onTap: () async {
                                print('Logout');
                                await _auth.signOut();
                              },
                            ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  welcome(){
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Hey, Ashley', 
                    textAlign: TextAlign.left, 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Learn About Chemistry!', 
                    textAlign: TextAlign.left, 
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "let's get started,", 
                    textAlign: TextAlign.left, 
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'choose a category', 
                    textAlign: TextAlign.left, 
                    style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20)),
                ]
              ),
          ),
        ),
        Container(         
          height: 300,
          width: 150,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 80,
                top: 20,
                  child:buildCircle(30, 30, 83, 204, 64, 80)),
                Positioned(
                left: 50,
                top: 60,
                  child:buildCircle(40, 40, 83, 204, 64, 80)),
                Positioned(
                left: 85,
                top: 100,
                  child:buildCircle(50, 50, 83, 204, 64, 80)),

            
            ]
          ),
        ),
      ],
    );
  }
  
  buildCircle(double w, double h, int r, int g, int b , double o){
    return Container(
                width: w,
                height: h,
                decoration: BoxDecoration(shape: BoxShape.circle,color: Color.fromRGBO(r, g, b, o)),
              );
  }

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
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(2, 5), // changes position of shadow
                ),
              ],
              color: Colors.red,
              borderRadius: BorderRadius.circular(20.0),
              image: DecorationImage(
                    image: AssetImage(images[index]), fit: BoxFit.fill)),
          ),
          Center(
            child: Text(
              name[index],
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans'),
            ),
          ),
        ],
      ),
    );
  }
}