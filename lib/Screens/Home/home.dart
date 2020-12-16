import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Global/drawer.dart';
import 'package:mynewapp/Global/carousel.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    //var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    size = MediaQuery.of(context).size;
    return Scaffold(
        key: _drawerKey,
        drawer: BuildDrawer(),
        body: Container(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _topbar(),
                  SizedBox(height: size.height * .05),
                  _greeting(),
                  SizedBox(height: size.height * .07),
                  NavigationCarousel(),
                ],
              ),
            ),
          ),
        ));
  }

  _topbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          splashRadius: 23,
          iconSize: 30,
          icon: Icon(Icons.sort),
          onPressed: () => _drawerKey.currentState.openDrawer(),
          splashColor: Colors.purple,
        ),
        Text(
          'Elements++',
          style: GoogleFonts.indieFlower(
              fontSize: FontSizes.large, fontWeight: FontWeight.bold),
        ),
        ClipOval(
          child: GestureDetector(
            onTap: () {},
            child: Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  Images.user,
                  fit: BoxFit.fill,
                )),
          ),
        ),
      ],
    );
  }

  _greeting() {
    var user = FirebaseAuth.instance.currentUser;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .snapshots(),
            builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Text('Hey!');
              } else if (snapshot.hasData) {
                return Text(
                  'Hey ${snapshot.data['firstName']}!',
                  overflow: TextOverflow.ellipsis,
                  style: CustomTextStyles.customText(isBold: true),
                );
              }
              return Center();
            }),
        SizedBox(
          height: size.height * .02,
        ),
        Text(
          'Lets get started try one of these items',
          style: CustomTextStyles.customText(
              color: Color.fromRGBO(129, 134, 163, 1), size: FontSizes.large),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Text(
          'just click on an item to continue...',
          style: CustomTextStyles.customText(
              color: Color.fromRGBO(129, 134, 163, 1), size: FontSizes.medium),
        ),
      ],
    );
  }
}
