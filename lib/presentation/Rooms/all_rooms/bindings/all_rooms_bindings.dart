import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/presentation/Authentication/signup_page_screen/controller/signup_controller.dart';
import 'package:flutter/material.dart';
import '../controller/all_rooms_controller.dart';

class AllRoomsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AllRoomsController());
  }
}