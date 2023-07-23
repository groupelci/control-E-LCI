import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../views/screens/bottombar_screen.dart';
import '../../views/widgets/my_custom_snackbar.dart';
import '../cache_helper.dart';
class SignupController extends GetxController {
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final passwordController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final formKeys = GlobalKey<FormState>();
  late bool obscurePassword = true;
  late final bool isSuccess;
  late PageController _pageController;
  double currentPageValue = 0.0;
  void togglePasswordVisibility() {
    obscurePassword = !obscurePassword;
    update(); // Update the state of the widget
  }
  @override
  void onInit() {
    super.onInit();
    _pageController = PageController();
    _pageController.addListener(() {
      currentPageValue = _pageController.page!;
      update();
    });
  }
  Future<void> signup() async {
    String name = nameController.text;
    String email = mailController.text;
    String password = passwordController.text;
    try {
      // Create a new user account in Firebase
      final UserCredential userCredential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      // Send verification email
     // await userCredential.user!.sendEmailVerification();
      // Store the user's name in Cloud Firestore
      await FirebaseFirestore.instance
          .collection('controlInformation')
          .doc(userCredential.user!.uid)
          .set({
        'name': name,
      });
      // Update the name field
      await CacheHelper.saveData(key: 'token', value: userCredential.user!.uid);
      CustomSnackbar('Success', 'Registration successful. Please check your email for verification.',isSuccess: true);
      print('whhhhhhhhhhhhhhhhhheeeeeeeeeeeeeerrrrrrrrrrrrrrrrreeeeeeeeeee');
      Get.to(() => BottombarScreen());
      // Check if the email is verified
      // if (userCredential.user!.emailVerified) {
      //   Get.to(() => BottombarScreen());
      // } else {
      //   Get.snackbar('Email Not Verified',
      //       'Please verify your email before proceeding.');
      // }
    } catch (e) {
      CustomSnackbar('Error', e.toString());
    }
  }
}