import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musium/utils/utils_color.dart';

class CustomSnackBar {
  static void showSnackBar(String message,String title) {
    Get.snackbar(
      title,
      message,
      backgroundColor: UtilsColor.whiteColor.withOpacity(0.5),
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      margin: const EdgeInsets.all(10),
      borderRadius: 10,
      snackStyle: SnackStyle.FLOATING,
    );
  }
}