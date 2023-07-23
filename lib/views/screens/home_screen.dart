import 'package:elearning/presenter/controllers/login_controller.dart';
import 'package:elearning/views/widgets/my_custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Get.lazyPut(() => LoginController()); // Initialize the controller
              Get.find<LoginController>().logout();
            },
            icon: Icon(Icons.login_outlined),
          )
        ],
      ),
    );
  }
}
