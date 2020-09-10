import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

import 'home.dart';
import 'search.dart';
import 'featured.dart';
import 'profile.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  DateTime currentBackPressTime;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.search), title: Text('Search')),
    BottomNavigationBarItem(icon: Icon(Icons.new_releases), title: Text('Featured')),
    BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.userAlt, size: 20.0), title: Text('Profile')),
  ];

  List<Widget> pages = [
    Home(),
    Search(),
    Featured(),
    Profile()
  ];

  Widget getPage(int index){
    return pages[index];
  }

  Future<bool> _onWillPopScope() {
    if (currentPage >= 1 && currentPage <= 3) {
      setState(() => currentPage = 0);
    } else {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: 'Press again to exit');
        return Future.value(false);
      }
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPopScope,
      child: Scaffold(
        body: getPage(currentPage),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.transparent,
          ),
          child: SnakeNavigationBar(
            currentIndex: currentPage,
            snakeColor: Colors.white,
            items: items,
            backgroundColor: Colors.black,
            onPositionChanged: (int page){
              setState(() => currentPage = page);
            },
          ),
        ),
      ),
    );
  }
}