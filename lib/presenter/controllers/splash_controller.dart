import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/screens/bottombar_screen.dart';
import '../../views/screens/started_screen.dart';
import '../../views/widgets/constant.dart';
class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    // Wait for some time and then navigate to the home screen
    Future.delayed(const Duration(seconds: 3), () {
      Widget StartScreen;
      if(token==null){
        StartScreen= const StartedScreen() ;
      }
      else{
        StartScreen= BottombarScreen();
      }
      Get.off(() =>  StartScreen);
    });
  }
}