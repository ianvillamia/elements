import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynewapp/Global/ocr.dart';
import 'package:mynewapp/Screens/LewisStructureCalculator/ocr.dart';
import 'package:mynewapp/Services/userService.dart';
import 'package:mynewapp/Widgets/rotateDevice.dart';
import 'package:mynewapp/Global/carousel.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:shape_of_view/shape_of_view.dart';
import 'package:mynewapp/Screens/Home/stars.dart';
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
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
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
    ));
  }

  _topbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.sort),
          onPressed: () {},
          splashColor: Colors.blue,
        ),
        Text(
          'Elements++',
          style: GoogleFonts.indieFlower(
              fontSize: FontSizes.large, fontWeight: FontWeight.bold),
        ),
        ClipOval(
          child: GestureDetector(
            onTap: () {
              context.read<AuthenticationService>().signOut();
            },
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
    FirebaseAuth auth = FirebaseAuth.instance;
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
