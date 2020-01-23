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
                      onTap: () =>
                        _scaffoldKey.currentState.openDrawer(),
                      
                      child: Icon(Icons.menu,
                          color: Color(0xFFF2c4e5e), size: 30)),
                  profile()
                ],
              ),
            );
}Widget profile() {
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