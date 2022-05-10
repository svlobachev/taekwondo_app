import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taekwondo_app/common/theme.dart';
import 'package:taekwondo_app/widgets/navigation/myAppBar.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyBottomNavigationBar> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.blue,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: primaryColor,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            // icon: Icon(Icons.account_balance),
            icon: FaIcon(FontAwesomeIcons.shop),
            title: Text('Залы'),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: FaIcon(FontAwesomeIcons.peopleGroup),
            title: Text('Тренеры'),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            // icon: Icon(Icons.heart),
            icon: FaIcon(FontAwesomeIcons.solidHeart),
            title: Text('Избранное'),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            // icon: Icon(Icons.account_box),
            icon: FaIcon(FontAwesomeIcons.userLarge),
            title: Text(
              'Профиль',
            ),
            activeColor: secondaryColor,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
