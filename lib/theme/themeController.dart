import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController{
  RxBool isDarkMode = false.obs;

  ThemeData get theme => isDarkMode.value ? darkTheme : lightTheme;

  void toggleTheme(){
    isDarkMode.value = !isDarkMode.value;
  }
}