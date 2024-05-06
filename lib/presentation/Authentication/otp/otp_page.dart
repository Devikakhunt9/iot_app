import 'dart:async';

import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/network/api_connection.dart';
import 'package:iot_application1/presentation/Authentication/otp/controller/otp_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/api.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/glassmorp_obj.dart';
import '../../../widgets/glassmorph_bg.dart';

class OtpPage extends GetWidget<OtpController>{

  OtpPage({Key? key}) : super(key:key);

  OtpController controller = OtpController();
  RxString errorCode = "".obs;


  late Timer _timer;
  int seconds = 15;

  void _startTimer() {
    const oneSec = Duration(seconds: 15);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        controller.seconds.value -- ;
      },
    );
  }
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context){
    final Map<String, dynamic> arguments = Get.arguments;
    final String userMail = arguments["email"];
    final String password = arguments["password"];
    final String phoneNumber = arguments["phoneNumber"];
    print(password);
    print(userMail);
    print(phoneNumber);
    controller.startTimer();
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                ///BG effects
                Column(
                  children: [
                    GlassMorpObj(t: 30,b: 0,l: 2,r: 0,sH: screenHeight * 10,sW: screenWidth * 20,),
                    GlassMorpObj(t: 15,b: 0,l: 0,r: 10,alignment: Alignment.topRight),
                  ],
                ),
                GlassMorpObj(t: 15,b: 0,l: 15,r: 2,alignment: Alignment.topRight,sH: screenHeight * 15,sW: screenWidth * 25,),
                GlassMorpObj(t: 3,b: 0,l: 15,r: 2,),
                GlassMorpObj(t: 60,b: 0,l: 2,r: 0,sH: screenHeight * 15,sW: screenWidth * 25,),
                GlassMorpObj(t: 80,b: 0,l: 40,r: 0,sH: screenHeight * 15,sW: screenWidth * 25,),
                GlassMorphBg(),

                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth*5,
                      vertical: screenHeight*10,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight*15),
                        Padding(
                            padding: EdgeInsets.only(right: 1.h),
                          child: Container(
                            height: screenHeight*53,
                            width: screenWidth*100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: LinearGradient(
                                colors: [
                                  Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
                                  Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.4),
                                ],
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                              ),
                              // color: Colors.red,
                              border: GradientBoxBorder(
                                gradient: LinearGradient(colors: [appTheme.black900,
                                  appTheme.orange900,]),
                                width: 3,
                              ),
                            ),
                            child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 19.h,
                                    vertical: 52.v),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40)
                                ),
                              child: Column(
                                children: [
                                  SizedBox(height: screenHeight*1),
                                  ///Heading text
                                  Text("lbl_opt_verification".tr,
                                      style: Theme.of(context).textTheme.headlineLarge),
                                  SizedBox(height: screenHeight*1),
                                  ///Subtitle text
                                  Text(
                                      "lbl_subtitle_otp"
                                          .tr,
                                      style: CustomTextStyles
                                          .titleSmallDMSansBluegray90001),
                                  SizedBox(height: screenHeight*3),
                                  ///Need to change to OTP Field
                                  OtpTextField(
                                    numberOfFields: 4,
                                    showFieldAsBox: false,
                                    borderWidth: 3,
                                    fieldWidth: 65,
                                    enabledBorderColor: Theme.of(context).colorScheme.inverseSurface,
                                    focusedBorderColor: PrimaryColors().orangeNormal,
                                    onSubmit: (String code){
                                      controller.otpController.value = code;
                                    },
                                  ),
                                  SizedBox(height: screenHeight*3),
                                  ///Resend and timer
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(left: 10.h),
                                        child: GestureDetector(
                                          onTap: ()async{
                                            if(controller.isResend.value){
                                              controller.seconds.value = 15;
                                              controller.startTimer();
                                              ApiConnection api = ApiConnection();
                                              var response = await api.post(API.resendOtp, {"email":userMail});
                                              print(response);
                                              print("All Good! for reset!!");
                                            }
                                          },
                                          child: Obx(
                                              () => Text("lbl_resend_otp".tr,
                                                style: controller.isResend.value ? CustomTextStyles.titleSmallDMSansBluegray90001After : CustomTextStyles.titleSmallDMSansBluegray90001),
                                          ),
                                        ),
                                      ),
                                      Obx(() =>
                                          Padding(
                                            padding: EdgeInsets.only(right: 10.h),
                                            child: Text(controller.seconds.value.toString()+":00",
                                                style: CustomTextStyles.titleSmallDMSansBluegray90001),
                                          ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: screenHeight*3),
                                  Obx(() =>
                                      Visibility(
                                        visible: controller.isErrorState.value,
                                        child: Text(
                                            controller.errorCode.value,
                                            style: CustomTextStyles
                                                .errorTitleSmallDMSansBluegray90001
                                        ),
                                      )
                                  ),
                                  SizedBox(height: screenHeight*3),
                                  ///Continue button
                                  Obx(
                                      () => controller.isLoading.value ? Center(
                                        child: CircularProgressIndicator(),
                                      ) : CustomElevatedButton(
                                        text: "lbl_otp_button".tr,
                                        ///Otp validation here....
                                        onPressed: ()async{
                                          try{
                                            controller.isLoadingState();
                                            ApiConnection api = ApiConnection();
                                            var response = await api.post(API.verifyOtp, {"email":userMail,"otp":controller.otpController.string});
                                            print(response);
                                            print("All Good!");
                                            print("Moving to home page");
                                            var auth = FirebaseAuth.instance;
                                            try{
                                              UserCredential userCredential = await auth.createUserWithEmailAndPassword(
                                                email: userMail,
                                                password: password,
                                              );
                                              /// Store phone number in Firestore or Realtime Database
                                              await _firestore.collection('users').doc(userCredential.user!.uid).set({
                                                'phoneNumber': phoneNumber,
                                              });
                                              controller.onLoadingDone();
                                              controller.isSuccess();
                                              SharedPreferences pref = await SharedPreferences.getInstance();
                                              pref.setBool("isLogin", true);
                                              ///Successfully verified redirecting to next page
                                              Get.offAllNamed(AppRoutes.createHome);
                                            } on FirebaseAuthException catch(e) {
                                              controller.isFailed();
                                              controller.onLoadingDone();
                                              // Handle signup errors
                                              print('Signup failed: $e');
                                              switch (e.code) {
                                                case 'email-already-in-use':
                                                  controller.isError(
                                                      'The email address is already in use.');
                                                  break;
                                                case 'weak-password':
                                                  controller.isError(
                                                      'The password provided is too weak.');
                                                  break;
                                                case 'invalid-email':
                                                  controller.isError(
                                                      'TThe email address is invalid.');
                                                  break;
                                                case 'operation-not-allowed':
                                                  controller.isError(
                                                      'Operation not allowed.');
                                                  break;
                                                default:
                                                  controller.isError(
                                                      'Sign-up failed');
                                                  break;
                                              }
                                            }
                                          }catch(e){
                                            print(e.toString());
                                            controller.isFailed();
                                            controller.onLoadingDone();
                                            controller.isError("There is some problem in the verify otp!!!");
                                            print("There is some problem in the verify otp!!!");
                                          }
                                        },
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}