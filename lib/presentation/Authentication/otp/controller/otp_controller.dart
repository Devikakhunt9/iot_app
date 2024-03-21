import 'dart:async';

import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/cupertino.dart';

class OtpController extends GetxController{
  late Timer _timer;
  RxInt seconds = 30.obs;
  RxBool isResend = false.obs;
  RxBool isLoading = false.obs;
  RxString otpController = "".obs;
  RxBool isErrorState = false.obs;
  RxString errorCode = "".obs;
  RxBool isSuccessState = false.obs;

  void isLoadingState(){
    isLoading.value = true;
  }

  void onLoadingDone(){
    isLoading.value = false;
  }

  void isFailed(){
    isErrorState.value = true;
  }

  void isSuccess(){
    isErrorState.value = false;
  }

  void isError(String val){
    isErrorState.value = true;
    errorCode.value = val;
    isSuccessState.value = false;
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    isResend.value = false;
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        seconds.value--;
        if(seconds.value==0){
          onClose();
          isResend.value = true;
        }
      },
    );
  }

  @override
  void onInit() {
    print('Test');
    super.onInit();
    startTimer();
  }
  @override
  void dispose(){
    super.dispose();
  }
  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }

}