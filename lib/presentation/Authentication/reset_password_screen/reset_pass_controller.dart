import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ResetPassController extends GetxController{

  TextEditingController newPass = TextEditingController();

  TextEditingController ConfirmPass = TextEditingController();
  RxBool isloading = false.obs;

  RxBool isVisibleConfirm = false.obs;

  RxBool isVisibleNew = false.obs;

}