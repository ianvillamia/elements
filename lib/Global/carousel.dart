import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mynewapp/Utils/carouselcard.dart';
import 'package:mynewapp/Strings/images.dart';

class NavigationCarousel extends StatefulWidget {
  @override
  _NavigationCarouselState createState() => _NavigationCarouselState();
}

class _NavigationCarouselState extends State<NavigationCarousel> {
  int _currentIndex = 0;
  List cardList = [Item1(), Item2(), Item3(), Item4()];

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
          height: size.height * .25,
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
                    //CarouselCard.navImage(size: size, image: Images.giraffe)
                  ],
                ));
          });
        }).toList(),
      ),
    );
  }
}

class Item1 extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CarouselCard.buildCategories(
        title: 'Compound Simulation',
        desc: 'Learn organic compounds through this  simulation game.',
        color1: Colors.deepPurple[300],
        color2: Colors.deepPurple[200],
        onTap: () {},
        size: size,
        image: Images.elephant);
  }
}

class Item2 extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CarouselCard.buildCategories(
        title: 'Learning Module',
        desc: 'Learn more about chemistry',
        color1: Colors.blue[400],
        color2: Colors.blue[200],
        onTap: () {},
        size: size,
        image: Images.giraffe);
  }
}

class Item3 extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CarouselCard.buildCategories(
        title: 'Lewis Structure Calculator',
        desc: 'Get your naming problem solve',
        color1: Colors.yellow[800],
        color2: Colors.yellow[600],
        onTap: () {},
        size: size,
        image: Images.owl);
  }
}

class Item4 extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return CarouselCard.buildCategories(
        title: 'Interactive Periodic Table of Elements',
        desc:
            'a well-organized view of elements according to its properties and characteristics.',
        color1: Colors.green[300],
        color2: Colors.green[200],
        onTap: () {},
        size: size,
        image: Images.hippo);
  }
}
