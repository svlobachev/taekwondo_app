import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

BottomNavigationBar bottomNavigationBar = BottomNavigationBar(
  items: <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Главная',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Залы',
    ),
    BottomNavigationBarItem(
      icon: Icon(FontAwesomeIcons.solidNewspaper),
      label: 'Новости',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.account_box_outlined),
      label: 'Профиль',
    ),
  ],
  // currentIndex: _selectedIndex,
  // selectedItemColor: Colors.amber[800],
  // onTap: _onItemTapped,
);
