import 'package:flutter/material.dart';

class CarouselCard {
  static buildCategories(
      {@required String title,
      @required String desc,
      @required String image,
      @required Color color1,
      color2,
      @required onTap,
      @required size}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color1, color2],
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
                padding: EdgeInsets.fromLTRB(10, 10, 42, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold)),
                    Text(desc,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Positioned(
                top: 18,
                right: -10,
                child: Container(
                  width: size.width * .25,
                  height: size.height * .18,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(image))),
                ),
              ),
            ],
          )),
    );
  }

  static navImage({@required size, @required String image}) {
    return Positioned(
      right: -25,
      child: Container(
        width: size.width * .35,
        height: size.height * .28,
        decoration:
            BoxDecoration(image: DecorationImage(image: AssetImage(image))),
      ),
    );
  }
}
