import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/login_controller.dart';
import '../widgets/color.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';
class LoginPopupContainer extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  LoginPopupContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.4; // Adjust the multiplier as needed
    return Container(
      padding: EdgeInsets.all(20),
      height: containerHeight, // You can adjust the height as needed
      decoration:  BoxDecoration(
        color: Colors.white, // Set the background color of the container
        borderRadius: BorderRadius.circular(20), // Make the corners oval
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MyCustomTextWidget(text:'Welcome back !' ,index: 1 ),
          SizedBox(height: 16),
          DefaultTextField(
            hintText: 'Email',
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: primaryColor,
            ),
            type: TextInputType.emailAddress,
          ),
          SizedBox(height: 8),
          DefaultTextField(
            hintText: 'Password',
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: primaryColor,
            ),
            type: TextInputType.visiblePassword,
            obscuretext: true,
          ),
          SizedBox(height: 16),
          CustomButton(
            buttomHight: 40.0,
            onPressed: () {
              if (loginController.formKey.currentState!.validate()) {
                loginController.login();
              }
            },
            text: 'LOGIN',
            primary: buttonColor,
            onPrimary: Colors.white,
            sideColor: buttonColor,
          ),
        ],
      ),
    );
  }
}