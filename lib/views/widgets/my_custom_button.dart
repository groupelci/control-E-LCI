import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color sideColor;
  final Color primary;
  final Color onPrimary;
  final double? buttomHight;
  final double? buttonwidth;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 20.0,
    required this.sideColor,
    required this.primary,
    required this.onPrimary,
    this.buttomHight= 50,
    this.buttonwidth=double.infinity,
    this.icon ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        child: Container(
            height: buttomHight ,
            width: buttonwidth,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                elevation: 5,
                shadowColor: Colors.deepOrange,
                primary: primary, // set the background color to white
                onPrimary: onPrimary, // set the text color to blue
                side:  BorderSide(color: sideColor, width: 2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),

              ),
              child: Row(
                children: [
               icon != null ? Icon(icon): SizedBox( width: screenWidth * 0.25,),
                SizedBox(
                  width: screenWidth * 0.07,
                ),
                Text(
                    text,
                    style:
                    const TextStyle(fontFamily:'GreatVibes',fontSize: 24, fontWeight: FontWeight.w700),
                  ),

              ],),
            )));
  }
}