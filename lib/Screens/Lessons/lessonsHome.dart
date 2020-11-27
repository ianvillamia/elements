import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Global/carousel.dart';
import 'package:mynewapp/Models/UserModel.dart';
import 'package:mynewapp/Models/CourseModel.dart';
import 'package:mynewapp/Providers/courseProvider.dart';
import 'package:mynewapp/Screens/Lessons/course.dart';

import 'package:mynewapp/Services/authentication_service.dart';
import 'package:mynewapp/Services/courseService.dart';
import 'package:mynewapp/Services/userService.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';
import 'package:mynewapp/Global/drawer.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class LessonsHome extends StatefulWidget {
  LessonsHome({Key key}) : super(key: key);

  @override
  _LessonsMainState createState() => _LessonsMainState();
}

class _LessonsMainState extends State<LessonsHome> {
  _getUser(firebaseUser) async {
    var user = await UserService().getUser(user: firebaseUser);
    print(user);
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  CourseProvider _courseProvider;
  User firebaseUser;
  Size size;
  @override
  Widget build(BuildContext context) {
    firebaseUser = context.watch<User>();
    //get user cred
    _getUser(firebaseUser);
    size = MediaQuery.of(context).size;
    _courseProvider = Provider.of<CourseProvider>(context, listen: false);
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      key: scaffoldKey,
      // drawer: BuildDrawer(),
      body: Container(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _greeting(),
              SizedBox(
                height: size.height * .03,
              ),
              Text(
                'Courses',
                style: CustomTextStyles.customText(
                    size: FontSizes.large, isBold: true),
              ),
              Expanded(
                child: _buildCategories(),
              )
            ],
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
                  style: CustomTextStyles.customText(isBold: true),
                );
              }
              return Center();
            }),
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

  _buildCategories() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(auth.currentUser.uid)
            .collection('courses')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            return Center(
              child: SingleChildScrollView(
                child: Wrap(
                    children: snapshot.data.docs
                        .map<Widget>((doc) => _card(
                              doc: doc,
                            ))
                        .toList()),
              ),
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  _card({@required DocumentSnapshot doc}) {
    CourseModel course = CourseModel.getData(doc: doc);
    return Column(
      children: [
        Hero(
          tag: course.title,
          child: Card(
              elevation: 5,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  _courseProvider.setCourseDoc(currentCourseDoc: doc);
                  _courseProvider.setCurrentCourse(courseModel: course);

                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return Course(
                        image: course.courseImageUrl,
                        lessons: course.lessons,
                        course: course);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(course.courseImageUrl),
                          fit: BoxFit.cover)),
                  width: size.width * .4,
                  height: size.height * .2,
                ),
              )),
        ),
        Text(course.title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.width * 0.023)),
      ],
    );
  }

  // test() {
  //   CourseService cs = CourseService();

  //   cs.takeLesson(
  //       course: _courseProvider.currentCourse,

  //       userRef: firebaseUser.uid,
  //       lessonNumber: 0);
  // }
}
