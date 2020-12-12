import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynewapp/Game/preludeToGame.dart';
import 'package:mynewapp/Screens/Home/home.dart';
import 'package:mynewapp/Screens/Lessons/lessonsHome.dart';
import 'package:mynewapp/Screens/Quiz/quiz_home.dart';
import 'package:mynewapp/Screens/Quiz/quiz_title.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

enum _SelectedTab { home, likes, search, profile }

class Parent extends StatefulWidget {
  Parent({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Parent> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  final controller = PageController(initialPage: 0);
  var _selectedTab = _SelectedTab.home;

  var selectedColor = Colors.white;

  void _handleIndexChanged(int i) {
    print(i);
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
      case 4:
        controller.animateToPage(4,
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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
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
          Home(),
          LessonsHome(),
          QuizHome(),
          // QuizTitle(),
          PreludeToGame(),
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        onTap: _handleIndexChanged,
        items: [
          _buildBottomBarItem(
              icon: Icons.home, text: 'Home', color: Colors.purple),
          _buildBottomBarItem(
              icon: Icons.book, text: 'Lessons', color: Colors.greenAccent),
          _buildBottomBarItem(
              icon: Icons.videogame_asset,
              text: 'Quiz',
              color: Colors.blueAccent),
          _buildBottomBarItem(
              icon: Icons.games, text: 'Elements', color: Colors.orange),
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
