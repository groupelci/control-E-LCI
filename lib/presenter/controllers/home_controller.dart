import 'package:elearning/presenter/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../views/widgets/my_custom_text.dart';
class HomeController extends GetxController {
  final RxBool showContainer1 = false.obs;
  final RxBool showContainer2 = false.obs;
  final LoginController loginController = Get.put(LoginController());
  void showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: MyCustomTextWidget(index:4 ,text:'Logout',),
          content: MyCustomTextWidget(index:6 ,text:'Are you sure you want to logout ?',),
          actions: [
            TextButton(
              onPressed: () {
                // Close the dialog
                Navigator.of(context).pop();
              },
              child:MyCustomTextWidget(index:4 ,text:'Cancel',),

        ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Get.lazyPut(() => LoginController()); // Initialize the controller
                Get.find<LoginController>().logout();
              },
              child:MyCustomTextWidget(index:4 ,text:'Logout',),
            ),
          ],
        );
      },
    );
  }
  void toggleContainer1() {
    // Toggle the visibility of Container 1
    showContainer1.toggle();
    // Ensure Container 2 is hidden when Container 1 is shown
    if (showContainer1.isTrue) {
      showContainer2.value = false;
    }
  }
  void toggleContainer2() {
    // Toggle the visibility of Container 2
    showContainer2.toggle();
    // Ensure Container 1 is hidden when Container 2 is shown
    if (showContainer2.isTrue) {
      showContainer1.value = false;
    }
  }
}