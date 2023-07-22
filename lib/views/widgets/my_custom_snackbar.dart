import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'color.dart';
CustomSnackbar(
    String title,
    String message,
    {bool isSuccess = false}) {
  Color backgroundColor = isSuccess ?  buttonColor: primaryColor;
  String title = isSuccess ? 'Success' : 'Error';
  Get.snackbar(
    title,
    message,
    icon:isSuccess ? Icon(Icons.check_circle,color: Colors.green,): Icon(Icons.no_accounts,color: Colors.red,),
    backgroundColor: backgroundColor,
    colorText: Colors.white,
    duration:const Duration(seconds: 5),
  );
}