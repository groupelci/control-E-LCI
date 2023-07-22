import 'package:flutter/material.dart';
class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final Color sideColor;
  final Color primary;
  final Color onPrimary;
  final double? buttomHight;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.borderRadius = 20.0,
    required this.sideColor,
    required this.primary,
    required this.onPrimary,
    this.buttomHight= 50 ,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5),
        child: Container(
            height: buttomHight ,
            width: double.infinity,
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
              child: Text(
                text,
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
            )));
  }
}