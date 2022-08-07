import 'package:fit_tracker/view/main_screen_view_model.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget CustomBottomNavBar(MainScreenViewModel model) {
  return BottomNavigationBar(
    currentIndex: model.selectedIndex,
    selectedItemColor: Colors.black,
    onTap: model.onItemTapped,
    items: const <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'Home',
        icon: Icon(Icons.home),
        backgroundColor: Colors.lightBlue,
      ),
      BottomNavigationBarItem(
        label: 'Settings',
        icon: Icon(Icons.person_rounded),
        backgroundColor: Colors.lightBlue,
      ),
    ],
  );
}
