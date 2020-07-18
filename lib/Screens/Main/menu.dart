import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mynewapp/Screens/Main/Learning_Module/learning_module.dart';
import 'package:mynewapp/Screens/Main/Periodic_Table/periodic_table.dart';
import 'package:mynewapp/Shared/appbar.dart';
import 'package:mynewapp/Shared/drawer.dart' as drawer;
import 'package:mynewapp/Shared/bottomNavigation.dart';
import 'package:mynewapp/Services/auth.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}


class _MenuState extends State<Menu> {
  int _currentIndex=0;

  List cardList=[
    LearningModule1(),
    CompoundSimulation1(),
    PeriodicTable1(),
    Item4()
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  // PageController pageController;
  // int current = 0;
  // List images = [
  //   "assets/learning-module.jpg",
  //   "assets/compound-simulation.jpg",
  //   "assets/periodic-table.jpg"
  // ];
  // List name = ["Learning Module", "Compound Simulation", "Periodic Table"];

  // @override
  // void initState() {
  //   super.initState();
  //   pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  // }

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
                        child: CarouselSlider(
                          height: 200.0,
                          aspectRatio: 2.0,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });
                          },
                          items: cardList.map((card){
                            return Builder(
                              builder:(BuildContext context){
                                return Container(
                                  height: MediaQuery.of(context).size.height*0.30,
                                  width: MediaQuery.of(context).size.width*0.75,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: card,
                                  ),
                                );
                              }
                            );
                          }).toList(),
                        ),
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

  // test() {
  //   return PageView.builder(
  //     controller: pageController,
  //     itemCount: images.length,
  //     itemBuilder: (context, position) {
  //       return _carousel(position);
  //     },
  //   );
  // }

  // _carousel(int index) {
  //   return AnimatedBuilder(
  //     animation: pageController,
  //     builder: (context, widget) {
  //       double value = 1;
  //       if (pageController.position.haveDimensions) {
  //         value = pageController.page - index;
  //         value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
  //       }
  //       return Container(
  //         child: Container(
  //           height: 300,
  //           child: widget,
  //         ),
  //       );
  //     },
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           height: 200,
  //           width: 400,
  //           margin: EdgeInsets.all(10),
  //           decoration: BoxDecoration(
  //             boxShadow: [
  //               BoxShadow(
  //                 color: Colors.black.withOpacity(0.2),
  //                 spreadRadius: 1,
  //                 blurRadius: 5,
  //                 offset: Offset(2, 5), // changes position of shadow
  //               ),
  //             ],
  //             color: Colors.red,
  //             borderRadius: BorderRadius.circular(20.0),
  //             image: DecorationImage(
  //                   image: AssetImage(images[index]), fit: BoxFit.fill)),
  //         ),
  //         Center(
  //           child: Text(
  //             name[index],
  //             style: TextStyle(
  //                 fontSize: 25,
  //                 fontWeight: FontWeight.bold,
  //                 fontFamily: 'OpenSans'),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}

class LearningModule1 extends StatelessWidget {
  const LearningModule1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 200,
            width: 400,
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
                    image: AssetImage("assets/learning-module.jpg"), fit: BoxFit.fill)),
          ),
      onTap: () =>
        Navigator.push(context,MaterialPageRoute(builder: (context) => LearningModule()))
      
    );
  }
}

class CompoundSimulation1 extends StatelessWidget {
  const CompoundSimulation1 ({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 200,
            width: 400,
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
                    image: AssetImage("assets/compound-simulation.jpg"), fit: BoxFit.fill)),
          ),
      // onTap: () =>
      //   Navigator.push(context,MaterialPageRoute(builder: (context) => CompoundSimulation()))
      
    );
  }
}

class PeriodicTable1 extends StatelessWidget {
  const PeriodicTable1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Container(
            height: 200,
            width: 400,
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
                    image: AssetImage("assets/periodic-table.jpg"), fit: BoxFit.fill)),
          ),
      onTap: () =>
        Navigator.push(context,MaterialPageRoute(builder: (context) => PeriodicTable()))
      
    );
  }
}

class Item4 extends StatelessWidget {
  const Item4({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Data",
            style: TextStyle(
              color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            )
          ),
          Text(
            "Data",
            style: TextStyle(
              color: Colors.white,
              fontSize: 17.0,
              fontWeight: FontWeight.w600
            )
          ),
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}