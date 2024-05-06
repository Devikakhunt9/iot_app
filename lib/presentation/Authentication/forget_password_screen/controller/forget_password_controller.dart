import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';


class ForgetPasswordController extends GetxController{
  
  TextEditingController emailController = TextEditingController();

  RxBool isStep1 = false.obs;
  RxBool isStep2 = false.obs;
  RxBool isStep3 = false.obs;
  RxInt percent = 0.obs;

  RxBool step1s = false.obs;
  RxBool step2s = false.obs;
  RxBool step3s = false.obs;

  RxBool isLoading = false.obs;
  RxBool isErrorState = false.obs;

  void incPercent(){
    percent.value+=33;
    print(percent.value);
  }
  void decPercent(int val){
    print("dec##########################################################");
    percent.value -=val;
    print(percent.value);
  }
  void onLoadingState(){
    isLoading.value = true;
  }

  void onLoadingStateDone(){
    isLoading.value = false;
  }

  void successState(){
    isErrorState.value = false;
  }

  void failedState(){
    isErrorState.value = true;
  }


  @override
  void onClose(){
    super.onClose();
    emailController.dispose();
  }
}