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
    'https://i.imgur.com/Uq8Bbnh.png',
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
    
      body: Stack(
        children: <Widget>[  Container(
          decoration:BoxDecoration(
            color: Colors.red
          //  image: DecorationImage(image: AssetImage('assets/background.png'),fit: BoxFit.cover)
          )),  Column(
            children: <Widget>[
         //     buildappbar(context, _scaffoldKey),
             //eto container ng top 
              Container(color: Colors.black,width: MediaQuery.of(context).size.width, child: buildPageView()),
              //bottom of scaff
              Container(
                color: Colors.blue,
                child: Text('Bottom'),
              )
            ],
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
        return Container(
        color: Colors.pink,
          height: 300,
         width: MediaQuery.of(context).size.width,
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
              height: 350,
              decoration: BoxDecoration(
                color: Colors.purple,
              borderRadius: BorderRadius.circular(40),
              ),
              width: 250,
              margin: EdgeInsets.all(10),
              child: Image.network(
                images[index],
  
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
