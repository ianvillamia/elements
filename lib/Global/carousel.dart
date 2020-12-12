import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:mynewapp/Strings/images.dart';

class NavigationCarousel extends StatefulWidget {
  @override
  _NavigationCarouselState createState() => _NavigationCarouselState();
}

class _NavigationCarouselState extends State<NavigationCarousel> {
  int _currentIndex = 0;
  List cardList = [
    CarouselItem(
      ontap: '/lessonsMain',
      title: 'Learning Module',
      description:
          'A collective set of lessons in which you could learn a lot through watching videos',
      image: Images.giraffe,
      color1: Colors.blue[400],
      color2: Colors.blue[200],
      textColor: Colors.white,
    ),
    CarouselItem(
      ontap: '/lewisStructure',
      title: 'Lewis Structure Calculator',
      description: 'Get your naming problem solve!',
      image: Images.owl,
      color1: Colors.yellow[800],
      color2: Colors.yellow[600],
      textColor: Colors.black,
    ),
    CarouselItem(
      ontap: '/periodicTable',
      title: 'Interactive Periodic Table of Elements',
      description:
          'a well-organized view of elements according to its properties and characteristics.',
      image: Images.hippo,
      color1: Colors.green[300],
      color2: Colors.green[200],
      textColor: Colors.white,
    ),
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Size size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
          viewportFraction: 0.75,
          height: size.height * .32,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: cardList.map((card) {
          return Builder(builder: (BuildContext context) {
            return Container(
                height: size.height * 0.40,
                width: size.width,
                decoration: BoxDecoration(
                  //color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Stack(
                  children: [
                    Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: card,
                    ),
                  ],
                ));
          });
        }).toList(),
      ),
    );
  }
}

class CarouselItem extends StatefulWidget {
  final String ontap;

  final String title, description, image;
  final Color color1, color2, textColor;
  CarouselItem(
      {@required this.ontap,
      @required this.title,
      @required this.description,
      @required this.image,
      @required this.color1,
      @required this.color2,
      @required this.textColor});

  @override
  _CarouselItemState createState() => _CarouselItemState();
}

class _CarouselItemState extends State<CarouselItem> {
  @override
  Size size;
  Orientation orientation;
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;
    size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.ontap);
      },
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [widget.color1, widget.color2],
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
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              flex: 40,
                              child: Text(widget.title,
                                  style: TextStyle(
                                      color: widget.textColor,
                                      fontSize: size.width * 0.055,
                                      fontWeight: FontWeight.bold)),
                            ),
                            Expanded(
                              flex: 60,
                              child: Padding(
                                padding:
                                    EdgeInsets.only(right: size.width * .25),
                                child: Text(widget.description,
                                    style: TextStyle(
                                      color: widget.textColor,
                                      fontSize: size.width * 0.035,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: -10,
                        child: Container(
                          width: orientation == Orientation.landscape
                              ? size.width * .0001
                              : size.width * .3,
                          height: orientation == Orientation.landscape
                              ? size.height * .0001
                              : size.height * .2,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(widget.image),
                                  fit: BoxFit.fitWidth)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
