import 'package:elearning/views/widgets/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../widgets/my_custom_button.dart';
import '../widgets/my_custom_text.dart';
import '../widgets/my_custom_textfield.dart';
class AddCourse extends StatelessWidget {
  const AddCourse({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_circle_left,color: primaryColor,) ,onPressed: (){
          Get.back();

        },
        ),
        title: MyCustomTextWidget(index: 1,text:'Add Course' ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  const EdgeInsets.symmetric(horizontal: 20.0,vertical: 100.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DefaultTextField(
                hintText: 'Add Course',
                prefixIcon:  const Icon(FontAwesomeIcons.book,color: primaryColor,) ,
                type: TextInputType.emailAddress,
                // controller: loginController.mailController,
              ),
              const SizedBox(height: 30,),
              DefaultTextField(
                hintText: 'Add SubCourse',
                prefixIcon:  const Icon(FontAwesomeIcons.bookOpen,color: primaryColor,) ,
                type: TextInputType.emailAddress,
                // controller: loginController.mailController,
              ),
              const SizedBox(height: 70,),
              CustomButton(
                onPressed: () {},
                buttonwidth: double.infinity,
                text: 'Submit',
                primary: buttonColor,
                onPrimary: Colors.white,
                sideColor: buttonColor,
                //icon: Icons.add_circle_outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}