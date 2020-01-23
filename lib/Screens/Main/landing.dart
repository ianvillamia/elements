import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  PageController pageController;

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
        body: SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.12,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFFF1f94aa).withOpacity(0.5),
                          blurRadius: 5)
                    ]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(

                        onTap: () {
                          print('Menu Item');
                        },
                        child: Icon(Icons.menu,
                            color: Color(0xFFF2c4e5e), size: 30)),
                    profile()
                  ],
                ),
              ),
              Container(height: 300, child: buildPageView()),
              Container(
                child: Text('data'),
              )
            ],
          ),
        ],
      ),
    ));
  }

  Widget profile() {
    return Row(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Name",
                style: TextStyle(
                    color: Color(0xFFF2c4e5e), fontWeight: FontWeight.bold)),
            Text("Etc", style: TextStyle(color: Color(0xFFF1f94aa))),
          ],
        ),
        SizedBox(width: 5),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.cover)),
        )
      ],
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
