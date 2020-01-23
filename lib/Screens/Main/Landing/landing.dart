import 'package:flutter/material.dart';
import 'package:mynewapp/Shared/appbar.dart';
import 'package:mynewapp/Shared/bottomNavigation.dart';
import 'package:mynewapp/Shared/drawer.dart';
class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController;
 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  //image list
  List<String> images = [
    'https://i.giphy.com/media/tHufwMDTUi20E/giphy.webp',
    'https://i.giphy.com/media/13Kguu4fbMbz1K/giphy.webp',
    'https://i.giphy.com/media/ziQVZDpNBSV7G/giphy.webp',
    'https://i.giphy.com/media/LzRrW7v0WFLzO/giphy.webp',
    'https://i.giphy.com/media/IPbS5R4fSUl5S/200.webp'
  ];
  List routename = [
    "Learning Module",
    "Compund Simulation",
    "Lewis Structure Calculator",
    "Periodic Table",
    "Quiz"
  ];
  List route = [];
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 1, viewportFraction: .8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: _scaffoldKey,
      drawer:buildDrawer() ,
      bottomNavigationBar:buildBottomNavigation(),

      body: Stack(
        children: <Widget>[  Container(
          decoration:BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/bg.png'),fit: BoxFit.cover)
          )),  SingleChildScrollView(
          child: Column(
            children: <Widget>[
              buildappbar(context, _scaffoldKey),
              Container(height: 300, child: buildPageView()),
              Container(
                child: Text('data'),
              )
            ],
          ),
        )],
   
         ),
      );

  }
 
  

  buildPageView() {
    return PageView.builder(
      controller: pageController,
      itemCount: images.length,
      itemBuilder: (context, position) {
        return imageSlider(position);
      },
    );
  }

  imageSlider(int index) {
    return AnimatedBuilder(
      animation: pageController,
      builder: (context, widget) {
        return SizedBox(
          height: 100,
          width: 200,
          child: widget,
        );
      },
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => route[index]));
        },
        child: Column(
          children: <Widget>[
            Container(
              height: 250,
              width: 350,
              margin: EdgeInsets.all(10),
              child: Image.network(
                images[index],
                fit: BoxFit.fill,
              ),
            ),
            Center(
              child: Text(routename[index]),
            )
          ],
        ),
      ),
    );
  }
}
