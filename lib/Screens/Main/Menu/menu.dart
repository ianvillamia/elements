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
    "https://i.imgur.com/n1bKdZr.png",
    "https://i.imgur.com/Z78Fymp.jpg",
    "https://i.imgur.com/eWN8NlX.png"
  ];

  @override
  void initState(){
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      drawer: buildDrawer(),
      bottomNavigationBar:buildBottomNavigation(),
      body: Stack(
        children: <Widget>[   
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                buildappbar(context, _scaffoldKey),
                Container(
                  height: 400, 
                  child: test()
                ),
              ],
            ),
          ),
        ],
      ),
  );


  test(){
   return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      itemBuilder: (context, position){
        return _carousel(position);
      },
    );
  }
  _carousel(int index){
    return AnimatedBuilder(
      animation: pageController, 
      builder: (context, widget){
        double value = 1;
        if(pageController.position.haveDimensions){
          value = pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 200,
            width: Curves.easeInOut.transform(value) * 250,
            child: widget,
          ),
        );
      },
      child: Container( 
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration( 
          borderRadius: BorderRadius.circular(3.0), 
          border: Border.all(color: Colors.grey[300])
        ), 
          child: ClipRRect( borderRadius: BorderRadius.circular(3.0), 
          child: Image.network(images[index], fit: BoxFit.fill),
      ),
      ),
    );
  }
}