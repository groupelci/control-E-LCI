import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../presenter/controllers/bottombar_controller.dart';
import '../widgets/color.dart';

class BottombarScreen extends StatelessWidget {
  final BottomBarController bottomBarController = Get.put(BottomBarController());
  BottombarScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:GetBuilder<BottomBarController>(
          init: BottomBarController(),
          builder: (bottomBarController) => bottomBarController.widgetOptions.elementAt(bottomBarController.selectedIndex)),
      bottomNavigationBar:GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (bottomBarController) =>  BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.homeUser),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon:Icon(FontAwesomeIcons.users) ,
              label: 'Users',
            ),
            BottomNavigationBarItem(
              icon:  Icon(FontAwesomeIcons.person),
              label: 'Controller',
            ),
          ],
          currentIndex: bottomBarController.selectedIndex,
          selectedItemColor: buttonColor,
          unselectedItemColor:primaryColor,
          onTap:bottomBarController.onItemTapped,
        ),),

    );
  }
}