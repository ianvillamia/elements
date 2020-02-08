import 'package:flutter/material.dart';

buildappbar(context,_scaffoldKey){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    width: MediaQuery.of(context).size.width,
    height: MediaQuery.of(context).size.height * 0.12,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(15),
        bottomRight: Radius.circular(15),
      ),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () =>
          _scaffoldKey.currentState.openDrawer(),
          child: Icon(
            Icons.menu,
            color: Color(0xFFF2c4e5e), 
            size: 30
          )
        ),
        rightPicture()
      ],
    ),
  );
}

rightPicture() => Row(
  children: <Widget>[
    Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage("assets/hermione.jpg"), 
          fit: BoxFit.cover
        ),
      ),
    ),
  ],
);