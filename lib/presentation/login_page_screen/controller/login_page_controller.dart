import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/login_page_screen/models/login_page_model.dart';
import 'package:flutter/material.dart';

/// A controller class for the LoginPageScreen.
///
/// This class manages the state of the LoginPageScreen, including the
/// current loginPageModelObj
class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  LoginPageModel model = LoginPageModel();

  RxBool isVisible = false.obs;

  void onLoading(){
    model.isLoading.value = true;
  }

  void onLoadingDone(){
    model.isLoading.value = false;
  }

  void onErrorState(){
    model.isErrorState.value = true;
    model.isSuccessState.value = false;
  }

  void onSuccessState(){
    model.isSuccessState.value = true;
    model.isErrorState.value = false;
  }


  // @override
  // void onClose() {
  //   super.onClose();
  //   emailController.dispose();
  //   passwordController.dispose();
  //   onSuccessState();
  // }

  @override
  void onReady() {
    Future.delayed(const Duration(milliseconds: 3000), () {
// TODO: implement Actions
    });
  }
}
