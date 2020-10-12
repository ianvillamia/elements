import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Models/UserModel.dart';
import 'package:mynewapp/Screens/Lessons/course.dart';
import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Services/userService.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:mynewapp/Global/drawer.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

enum _SelectedTab { home, likes, search, profile }

class LessonsMain extends StatefulWidget {
  LessonsMain({Key key}) : super(key: key);

  @override
  _LessonsMainState createState() => _LessonsMainState();
}

class _LessonsMainState extends State<LessonsMain> {
  var _selectedTab = _SelectedTab.home;

  var selectedColor = Colors.white;

  void _handleIndexChanged(int i) {
    var color;
    switch (i) {
      case 0:
        color = Colors.white;
        break;
      case 1:
        color = Colors.pink;
        break;
      case 2:
        color = Colors.orange;
        break;
      case 3:
        color = Colors.teal;
        break;
      default:
    }
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      selectedColor = color;
    });
  }

  _getUser(firebaseUser) async {
    var user = await UserService().getUser(user: firebaseUser);
    print(user);
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  Size size;
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    //get user cred
    _getUser(firebaseUser);
    size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.pink,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
      drawer: BuildDrawer(),
      body: Container(
        color: selectedColor,
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //enter widgets here
                //topbar
                _topbar(),
                SizedBox(
                  height: size.height * .05,
                ),
                _greeting(),

                SizedBox(
                  height: size.height * .03,
                ),
                Align(
                  alignment: Alignment.center,
                  child: _searchBar(),
                ),
                SizedBox(
                  height: size.height * .03,
                ),
                Text(
                  'Categories',
                  style: CustomTextStyles.customText(
                      size: FontSizes.large, isBold: true),
                ),
                _buildCategories()
              ],
            ),
          ),
        ),
      ),
    );
  }

  _topbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          iconSize: 30,
          icon: Icon(Icons.sort),
          onPressed: () => scaffoldKey.currentState.openDrawer(),
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
              color: Colors.red,
            ),
          ),
        ),
      ],
    );
  }

  _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hey',
          style: CustomTextStyles.customText(isBold: true),
        ),
        SizedBox(
          height: size.height * .02,
        ),
        Text(
          'Find a course you want to learn',
          style: CustomTextStyles.customText(
              color: Color.fromRGBO(129, 134, 163, 1),
              size: FontSizes.subHeading),
        ),
      ],
    );
  }

  _searchBar() {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50), color: Colors.transparent),
        width: size.width * .8,
        height: size.height * .08,
        child: TextField(
            decoration: InputDecoration(
                filled: true,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search something ...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero)));
  }

  _buildCategories() {
    return Wrap(
      children: [
        _card(image: Images.city),
      ],
    );
  }

  _card({@required String image}) {
    return Hero(
      tag: 'homeHero',
      child: Card(
          elevation: 5,
          child: InkWell(
            splashColor: Colors.blue.withAlpha(30),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Course(
                  image: image,
                );
              }));
            },
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.fill)),
              width: size.width * .4,
              height: size.height * .2,
            ),
          )),
    );
  }
}
