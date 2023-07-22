import 'package:elearning/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp();
  // token='';
  // token=await CacheHelper.importData(key: 'token');
  // print(token);
  // Widget startedScreen;
  // if(token==null){
  //   startedScreen= SplashScreen() ;
  // }
  // else{
  //   startedScreen= BottomBar();
  // }
  runApp(   GetMaterialApp(
    title: 'ELearning',
    debugShowCheckedModeBanner: false,
    home:  SplashScreen(),
    // theme: settingsController.lightTheme, // Set the light theme
    // darkTheme: settingsController.darkTheme, // Set the dark theme
    // themeMode: settingsController.currentThemeMode.value, // Set the initial theme mode
  ));
}