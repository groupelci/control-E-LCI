import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'color.dart';
import 'my_custom_text.dart';
class MyContainer extends StatelessWidget {
  final String text;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final IconData? icon;
  final Color containerColor;
  final int index;
  final double sizeicon;
  GestureTapCallback? gestuorTap;
  final double? widthContainer;
  final double?heightContainer;
  MyContainer({
    required this.text,
    this.borderRadius = 20.0,
    this.borderColor = primaryColor,
    this.borderWidth = 1.0,
    required this.index,
    this.containerColor = Colors.white,
    this.gestuorTap,
    this.sizeicon = 50,
    this.widthContainer,
    this.heightContainer=80,
    this.icon,
  });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: GestureDetector(
        onTap: gestuorTap,
        child: Container(
          height:heightContainer ,
          width: widthContainer, // Set the width of the container if provided
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color:
              // settingscontroller.isDarkMode.value
              //     ?  Colors.black// Use dark mode color
                  buttonColor , // Use light mode color
              width: borderWidth,
            ),
            color:
            // settingscontroller.isDarkMode.value
            //     ? Colors.black54 // Use dark mode color
                 containerColor, // Use light mode color
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(icon,size:sizeicon,color:
                // settingscontroller.isDarkMode.value
                //     ? buttonColor // Use dark mode color
                     primaryColor,) ,
                 SizedBox(width: screenWidth*0.15 ),
                Expanded(
                    child: MyCustomTextWidget(index: index, text: text)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}