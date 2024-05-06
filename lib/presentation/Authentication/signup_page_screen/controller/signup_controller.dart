import 'package:flutter/material.dart';
import 'package:iot_application1/core/app_export.dart';
import '../models/signup_model.dart';

class SignupPageController extends GetxController{
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneNumberController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  Rx<SignupModel> signupModelObj = SignupModel().obs;

  Rx<bool> rememberInformation = false.obs;

  RxString errorCode = "".obs;

  RxBool isVisible = false.obs;

  SignupModel model = SignupModel();

  void isLoadingState(){
    model.isLoadingState.value = true;
  }

  void onLoadingDone(){
    model.isLoadingState.value = false;
  }

  void isSuccessState(){
    model.isSuccessState.value = true;
    model.isErrorState.value = false;
  }

  void isErrorState(String val){
    model.isErrorState.value = true;
    errorCode.value = val;
    model.isSuccessState.value = false;
  }


  // void onClose() {
  //   super.onClose();
  //   emailController.dispose();
  //   phoneNumberController.dispose();
  //   passwordController.dispose();
  //   emailController.clear();
  //   phoneNumberController.clear();
  //   passwordController.clear();
  // }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
// TODO: implement Actions
    });
  }
}
