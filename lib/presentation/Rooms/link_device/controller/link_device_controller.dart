import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/cupertino.dart';

class LinkDeviceController extends GetxController {
  TextEditingController deviceNameController = TextEditingController();
  RxString selectedValue = "".obs;
}