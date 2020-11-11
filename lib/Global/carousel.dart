import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class NavigationCarousel extends StatefulWidget {
  @override
  _NavigationCarouselState createState() => _NavigationCarouselState();
}

class _NavigationCarouselState extends State<NavigationCarousel> {
  int _currentIndex = 0;
  List cardList = [item1(), item2(), item3(), item4()];
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
      child: Column(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: size.height * .25,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items: cardList.map((card) {
              return Builder(builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    color: Colors.blueAccent,
                    child: card,
                  ),
                );
              });
            }).toList(),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: map<Widget>(cardList, (index, url) {
          //     return Container(
          //       width: 10.0,
          //       height: 10.0,
          //       margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          //       decoration: BoxDecoration(
          //         shape: BoxShape.circle,
          //         color:
          //             _currentIndex == index ? Colors.blueAccent : Colors.grey,
          //       ),
          //     );
          //   }),
          // ),
        ],
      ),
    );
  }

  static item1() {
    return Container(
      child: MaterialButton(
        onPressed: () {},
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text("Compound Simulation",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold)),
            Text("Learn organic compounds through this  simulation game.",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }

  static item2() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Learning Module",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Learn more about chemistry",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  static item3() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Lewis Structure Calculator",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text("Get your naming problem solve",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  static item4() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text("Interactive Periodic Table of Elements",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold)),
          Text(
              "a well-organized view of elements according to its properties and characteristics.",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
