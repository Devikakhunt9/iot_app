import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ThemeController extends GetxController{
  RxBool isDarkMode = false.obs;

  ThemeData get theme => isDarkMode.value ? darkTheme : lightTheme;

  void toggleTheme(){
    isDarkMode.value = !isDarkMode.value;
  }
}