import 'dart:ui';

import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Authentication/forget_password_screen/controller/forget_password_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../core/utils/validation_functions.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_floating_text_field.dart';
import '../../../widgets/glassmorp_obj.dart';
import '../../../widgets/glassmorph_bg.dart';

class ForgetPasswordPage extends GetWidget<ForgetPasswordController> {
  ForgetPasswordPage({Key? key}) : super(key: key);

  ForgetPasswordController controller = ForgetPasswordController();

  @override
  Widget build(BuildContext context){
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
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
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
                                      Text("lbl_reset_password".tr,
                                          style: Theme.of(context).textTheme.headlineLarge),
                                      SizedBox(height: screenHeight*1),
                                      ///Subtitle text
                                      Text(
                                          "lbl_subtitle_password"
                                              .tr,
                                          style: CustomTextStyles
                                              .titleSmallDMSansBluegray90001),
                                      SizedBox(height: screenHeight*3),
                                      ///Need to change to OTP Field
                                      CustomFloatingTextField(
                                          context: context,
                                          controller: controller
                                              .emailController,
                                          labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                                          labelText: "lbl_user_email_com".tr,
                                          // hintText:
                                          //     "lbl_password".tr,
                                          textInputAction:
                                          TextInputAction
                                              .done,
                                          textInputType:
                                          TextInputType
                                              .emailAddress,
                                          ///Email validation here
                                          validator: (value) {
                                            if (value == null ||
                                                (!isValidEmail(
                                                    value,
                                                    isRequired:
                                                    true))) {
                                              return "err_msg_please_enter_valid_email"
                                                  .tr;
                                            }
                                            return null;
                                          }),
                                      SizedBox(height: screenHeight*2),
                                      Obx(() =>
                                          Visibility(
                                            visible: controller.isErrorState.value,
                                            child: Text(
                                                "Please check your email and try again!",
                                                style: CustomTextStyles
                                                    .errorTitleSmallDMSansBluegray90001
                                            ),
                                          )
                                      ),
                                      SizedBox(height: screenHeight*2),
                                      ///Continue button
                                      Obx(
                                            () => controller.isLoading.value ? Center(
                                          child: CircularProgressIndicator(),
                                        ) : CustomElevatedButton(
                                          text: "lbl_reset_button".tr,
                                          ///Otp validation here....
                                          onPressed: ()async{
                                            if(controller.emailController.text.isEmpty){
                                              controller.failedState();
                                            }else{
                                              try{
                                                controller.onLoadingState();
                                                controller.successState();
                                                FirebaseAuth auth = FirebaseAuth.instance;
                                                await auth.sendPasswordResetEmail(email: controller.emailController.text.trim());
                                                await Future.delayed(Duration(seconds: 2));
                                                controller.onLoadingStateDone();
                                                ScaffoldMessenger.of(context).showSnackBar(
                                                    SnackBar(
                                                      content: Text('lbl_reset_email_success'.tr ,style:  CustomTextStyles.labelLargeDMSansWhiteA700,),
                                                      backgroundColor:PrimaryColors().orangeNormal,
                                                      elevation: 10,
                                                      behavior: SnackBarBehavior.floating,
                                                      margin: EdgeInsets.only(left: screenWidth*2,bottom: screenHeight*3,right: screenHeight*2),
                                                    )
                                                );
                                                await Future.delayed(Duration(seconds: 1));
                                                Get.toNamed(AppRoutes.loginPageScreen);
                                                // Navigator.push(context, MaterialPageRoute(builder: (context) => DummyHomePage()));
                                              }catch(e){
                                                print(e.toString());
                                                controller.failedState();
                                                await Future.delayed(Duration(seconds: 1));
                                                controller.onLoadingStateDone();
                                                print("There is some problem in the verify otp!!!");
                                              }
                                            }
                                          },
                                        ),
                                      ),
                                      SizedBox(height: screenHeight*2),
                                      CustomElevatedButton(
                                          text: "Back to Login",
                                          onPressed: (){
                                            Get.toNamed(AppRoutes.loginPageScreen);
                                          },
                                      )
                                    ],
                                  ),
                                ),
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