import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynewapp/Strings/images.dart';
import 'package:mynewapp/Utils/textStyles.dart';

class LessonsMain extends StatefulWidget {
  LessonsMain({Key key}) : super(key: key);

  @override
  _LessonsMainState createState() => _LessonsMainState();
}

class _LessonsMainState extends State<LessonsMain> {
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.white,
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
                  height: size.height * .1,
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
          onPressed: () {},
          splashColor: Colors.blue,
        ),
        Text(
          'Elements++',
          style: GoogleFonts.indieFlower(
              fontSize: FontSizes.large, fontWeight: FontWeight.bold),
        ),
        ClipOval(
          child: Container(
            width: 50,
            height: 50,
            color: Colors.red,
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
          'Hey Alex',
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
        _card(),
        _card(),
        _card(),
        _card(),
      ],
    );
  }

  _card() {
    return Card(
        elevation: 5,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(30),
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(Images.read1), fit: BoxFit.contain)),
            width: size.width * .4,
            height: size.height * .2,
          ),
        ));
  }
}
