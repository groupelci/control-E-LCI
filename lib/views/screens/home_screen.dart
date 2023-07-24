import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/home_controller.dart';
import '../widgets/color.dart';
import '../widgets/my_custom_button.dart';

class HomeScreen extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        actions: [
          IconButton(
            onPressed: () {
              homeController.showLogoutConfirmationDialog(context);
            },
            icon: const Icon(
              Icons.login_outlined,
              color: buttonColor,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    onPressed: () => homeController.toggleContainer1(),
                    buttonwidth: 150.0,
                    text: 'Add',
                    primary: buttonColor,
                    onPrimary: Colors.white,
                    sideColor: buttonColor,
                  ),
                  const SizedBox(width: 20),
                  CustomButton(
                    onPressed: () => homeController.toggleContainer2(),
                    buttonwidth: 150.0,
                    text: 'Courses',
                    primary: buttonColor,
                    onPrimary: Colors.white,
                    sideColor: buttonColor,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(() => Stack(
                  children: [
                    // Container 1
                    if (homeController.showContainer1.isTrue)
                       Container(
                        color: Colors.blue,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Add your widgets for Container 1 here
                              // ...
                              // Example: A list of items
                              for (int i = 0; i < 20; i++)
                                ListTile(title: Text('Item $i')),
                            ],
                          ),
                        ),
                      ),
                    // Container 2
                    if (homeController.showContainer2.isTrue)
                       Container(
                        color: Colors.green,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [

                              for (int i = 0; i < 30; i++)
                                ListTile(title: Text('Item $i')),
                            ],
                          ),
                        ),
                      ),
                  ],
                )),
              ),
            ],
          ),

      ),
    );
  }
}
