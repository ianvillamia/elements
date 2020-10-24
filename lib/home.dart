import 'package:flutter/material.dart';
import 'package:mynewapp/Screens/Game/protoGame.dart';
import 'package:mynewapp/Screens/Lessons/lessons_home.dart';
import 'package:mynewapp/Screens/Quiz/quiz_home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

enum _SelectedTab { home, likes, search, profile }

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final controller = PageController(initialPage: 0);
  var _selectedTab = _SelectedTab.home;

  var selectedColor = Colors.white;

  void _handleIndexChanged(int i) {
    switch (i) {
      case 0:
        controller.animateToPage(0,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        break;
      case 1:
        controller.animateToPage(1,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);

        break;
      case 2:
        controller.animateToPage(2,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);

        break;
      case 3:
        controller.animateToPage(3,
            duration: Duration(milliseconds: 500), curve: Curves.easeIn);

        break;
      default:
    }
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _selectedTab = _SelectedTab.values[index];
          });
        },
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          LessonsMain(),
          QuizHome(),
          ProtoGame(),
          Container(
            color: Colors.pink,
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          _buildBottomBarItem(
              icon: Icons.home, text: 'Home', color: Colors.purple),
          _buildBottomBarItem(
              icon: Icons.videogame_asset,
              text: 'Quiz',
              color: Colors.blueAccent),

          _buildBottomBarItem(
              icon: Icons.search, text: 'Search', color: Colors.orange),
          _buildBottomBarItem(
              icon: Icons.person, text: 'Profile', color: Colors.teal),

          /// Profile
        ],
      ),
    );
  }

  _buildBottomBarItem({IconData icon, String text, Color color}) {
    return SalomonBottomBarItem(
      icon: Icon(icon),
      title: Text(text),
      selectedColor: color,
    );
  }
}
