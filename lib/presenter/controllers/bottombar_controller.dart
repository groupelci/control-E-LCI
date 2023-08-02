import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/screens/controllers_screen.dart';
import '../../views/screens/home_screen.dart';
import '../../views/screens/users_screen.dart';
class BottomBarController extends GetxController {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    Controllers(),
    Users(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    print('index selected $index');
    update();
  }

}