import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:elearning/presenter/cache_helper.dart';
import 'package:elearning/presenter/controllers/theme_controller.dart';
import 'package:elearning/views/screens/splash_screen.dart';
import 'package:elearning/views/widgets/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  ThemeController settingsController=Get.put(ThemeController());
  token='';
  token=await CacheHelper.importData(key: 'token');
  await Firebase.initializeApp(
    name: 'control',
    options: const FirebaseOptions(
      appId: '1:887355543232:android:4b129380f128de45952725',
      apiKey: 'AIzaSyBZwngCCj3i-jviEAALBWtQrhnVInPbV1Q',
      projectId: 'control-e-lci',
      messagingSenderId: '887355543232',
    ),
  );
  await Firebase.initializeApp(
    name: 'elci',
    options: const FirebaseOptions(
      appId: '1:16097792232:android:aecb325261ef77f660b95d',
      apiKey: 'AIzaSyC4nubsrr5QnYO1sMqJaN8wGPdicYGN51M',
      projectId: 'groupelci',
      messagingSenderId: '16097792232',
    ),
  );
  runApp(   GetMaterialApp(
    title: 'ELearning',
    debugShowCheckedModeBanner: false,
    home:  SplashScreen(),
    theme: settingsController.lightTheme, // Set the light theme
    darkTheme: settingsController.darkTheme, // Set the dark theme
    themeMode: settingsController.currentThemeMode.value, // Set the initial theme mode
  ));
  FirebaseFirestore firestoreControl = FirebaseFirestore.instanceFor(app: Firebase.app('control'));
  FirebaseFirestore firestoreElci = FirebaseFirestore.instanceFor(app: Firebase.app('elci'));
}