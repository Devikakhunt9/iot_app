import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LinkDeviceController extends GetxController {
  TextEditingController deviceNameController = TextEditingController();
  RxString selectedValue = "".obs;
}