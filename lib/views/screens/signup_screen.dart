import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../presenter/controllers/signup_controller.dart';
import '../widgets/color.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';
class SignupPopupContainer extends StatelessWidget {
  final SignupController signupController = Get.put(SignupController());
  SignupPopupContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double containerHeight = MediaQuery.of(context).size.height * 0.5; // Adjust the multiplier as needed
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
          MyCustomTextWidget(text:'Create an account' ,index: 1 ),
          const SizedBox(height: 16),
          DefaultTextField(
            hintText: 'Full Name',
            prefixIcon: const Icon(
              Icons.perm_identity,
              color: primaryColor,
            ),
            type: TextInputType.text,
            controller: signupController.nameController,
          ),
          const SizedBox(height: 8),
          DefaultTextField(
            hintText: 'Email',
            prefixIcon: const Icon(
              Icons.email_outlined,
              color: primaryColor,
            ),
            type: TextInputType.emailAddress,
            controller: signupController.mailController,
            validatorFn: validateEmail,

          ),
          const SizedBox(height: 8),
          GetBuilder<SignupController>(
            init: SignupController(),
            builder: (signupController) => DefaultTextField(
              hintText: 'Password',
              prefixIcon: const Icon(Icons.lock, color: primaryColor),
              controller: signupController.passwordController,
              type: TextInputType.visiblePassword,
              validatorFn: validatePassword,
              obscuretext: signupController.obscurePassword,
              suffix: signupController.obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined ,
              suffixFunction: () {
                signupController.togglePasswordVisibility();
              },
            ),
          ),
          const SizedBox(height: 16),
          CustomButton(
            buttomHight: 40.0,
            onPressed: ()async{
              await signupController.signup();
            },
            text: 'Signup',
            primary: buttonColor,
            onPrimary: Colors.white,
            sideColor: buttonColor,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}