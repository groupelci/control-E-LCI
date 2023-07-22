import 'package:elearning/views/screens/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/color.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import 'login_screen.dart';
class StartedScreen extends StatelessWidget {
  const StartedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset('assets/images/lgb.png', height: 40,width: 40,),
                  const SizedBox(width: 10,),
                  MyCustomTextWidget(index: 3,text: 'LCI Group' ,)
                ],
              ),
              const SizedBox(height: 30,),
              Image.asset('assets/images/organisation.png'),
              MyCustomTextWidget(index:1 ,text:'Welcome!' ,),
              const SizedBox(height: 30,),
              MyCustomTextWidget(index:2 ,text:'to the Control App for E-LCI!' ,),
              const SizedBox(height: 5,),
              MyCustomTextWidget(index:2 ,text:'Your all-in-one solution to ',),
              const SizedBox(height:5,),
              MyCustomTextWidget(index:2 ,text:'manage and control the E-LCI system',),
              const SizedBox(height:100,),
              CustomButton(
                  text:'LOGIN' ,
                  onPressed:(){
                    Get.bottomSheet(LoginPopupContainer(), isScrollControlled: true,
                    );
                  },
                  sideColor: buttonColor,
                  onPrimary:Colors.white ,
                  primary:buttonColorWith ),
              CustomButton(text:'SIGNUP' ,
                  onPressed:() {
                    Get.bottomSheet(SignupPopupContainer(), isScrollControlled: true,
                    );
                  },
                  sideColor: secondColor,
                  primary: Colors.white,
                  onPrimary:secondColor ),

            ],
          ),
        ),
      ),
    );
  }
}