import 'dart:ui';
import 'package:iot_application1/widgets/Auth_Widgets/orDivder.dart';
import 'package:iot_application1/widgets/glassmorp_obj.dart';
import 'package:iot_application1/widgets/glassmorph_bg.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controller/login_page_controller.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/utils/validation_functions.dart';
import 'package:iot_application1/widgets/custom_elevated_button.dart';
import 'package:iot_application1/widgets/custom_floating_text_field.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class LoginPageScreen extends GetWidget<LoginPageController> {
  LoginPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPageController controller = LoginPageController();
  

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Theme.of(context).colorScheme.background,
            //backgroundColor: Colors.purple,
            body: Form(
                key: _formKey,
                child: SizedBox(
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
                                  vertical: screenHeight*11,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(height: screenHeight*4),
                                    ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                                        child: Container(
                                          height: screenHeight*73,
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
                                                borderRadius: BorderRadius.circular(40),
                                              ),
                                              child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    SizedBox(height: screenHeight*2),
                                                    ///Login Text
                                                    Text("lbl_login".tr,
                                                        style: Theme.of(context).textTheme.headlineLarge),
                                                    SizedBox( height: screenHeight*1),
                                                    ///Welcome Text
                                                    Text(
                                                        "msg_welcome_back_please"
                                                            .tr,
                                                        style: CustomTextStyles
                                                            .titleSmallDMSansBluegray90001,
                                                      textAlign: TextAlign.center,
                                                    ),
                                                    SizedBox(height: screenHeight*5),
                                                    ///Email text field
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
                                                    ///Password Text Field
                                                    Obx(
                                                        () => CustomFloatingTextField(
                                                          context: context,
                                                            hintStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                                                            controller: controller
                                                                .passwordController,
                                                            labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                                                            labelText: "lbl_password".tr,
                                                            // suffixWidget: Icon(Icons.visibility,color: Colors.red,),
                                                            textInputAction:
                                                            TextInputAction
                                                                .done,
                                                            textInputType:
                                                            TextInputType
                                                                .visiblePassword,
                                                            obscureText: controller.isVisible.value ? false : true,
                                                            suffix: GestureDetector(
                                                              onTap: (){
                                                                controller.isVisible.value = ! controller.isVisible.value;
                                                              },
                                                              child:controller.isVisible.value ?Icon(Icons.visibility,color: PrimaryColors().orangeNormal,) : Icon(Icons.visibility_off,color: PrimaryColors().orangeNormal,)
                                                            ),
                                                            ///Password validation here
                                                            validator: (value) {
                                                              if (value == null ) {
                                                                return "err_msg_please_enter_valid_password"
                                                                    .tr;
                                                              }
                                                              return null;
                                                            }),
                                                    ),
                                                    SizedBox(height: screenHeight*2),
                                                    ///Error message here!!
                                                    ///Obs
                                                    Obx(() =>
                                                      Visibility(
                                                      visible: controller.model.isErrorState.value,
                                                      child: Text(
                                                          "msg_auth_error"
                                                              .tr,
                                                          style: CustomTextStyles
                                                              .errorTitleSmallDMSansBluegray90001),
                                                     )
                                                    ),
                                                    SizedBox(height: screenHeight*2),
                                                    ///Login Button
                                                    Obx(() =>
                                                      controller.model.isLoading.value ?
                                                          Center(
                                                            child: CircularProgressIndicator(),
                                                          ) :
                                                      CustomElevatedButton(
                                                        text: "lbl_login".tr,
                                                        ///Login screen validation here....
                                                        onPressed: ()async{
                                                          if(_formKey.currentState!.validate()){
                                                            controller.onLoading();
                                                            try {
                                                              print(controller.emailController.text);
                                                              print(controller.passwordController.text);
                                                              // await _auth.signInWithEmailAndPassword(
                                                              //   email: controller.emailController.text,
                                                              //   password: controller.passwordController.text,
                                                              // );
                                                              SharedPreferences pref = await SharedPreferences.getInstance();
                                                              pref.setBool("isLogin", true);
                                                              /// Navigate to the next screen after successful login
                                                              controller.emailController.clear();
                                                              controller.passwordController.clear();
                                                              controller.model.isErrorState.value = false;
                                                              // Example:
                                                              Get.offAllNamed(AppRoutes.homepage);
                                                              controller.onLoadingDone();
                                                            } catch (e) {
                                                              // Handle login errors
                                                              print('Login failed: $e');
                                                              controller.onLoadingDone();
                                                              controller.onErrorState();
                                                            }
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    SizedBox(height: screenHeight*2),
                                                    ///Forget Password
                                                    GestureDetector(
                                                      onTap: (){
                                                        print("Towards Forget Password Screen...");
                                                        controller.emailController.clear();
                                                        controller.passwordController.clear();
                                                        controller.model.isSuccessState.value = false;
                                                        controller.model.isErrorState.value = false;
                                                        Get.toNamed(AppRoutes.forgetPasswordScreen);
                                                      },
                                                      child: Text(
                                                          "msg_forget_password"
                                                              .tr,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: CustomTextStyles
                                                              .titleSmallDMSansErrorContainer),
                                                    ),
                                                    SizedBox(height:screenHeight*1),
                                                    /// Or text field
                                                    OrDivider(),
                                                    SizedBox(height: screenHeight*1.5),
                                                    Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                        children: [
                                                          ///First time here
                                                          Text(
                                                              "msg_first_time_here"
                                                                  .tr,
                                                              style: CustomTextStyles.titleSmallDMSansBluegray900),

                                                          SizedBox(width: screenWidth*2,),
                                                          ///Sign up Text link
                                                          GestureDetector(
                                                            onTap: (){
                                                              print("On Signup page clicked!");
                                                              controller.emailController.clear();
                                                              controller.passwordController.clear();
                                                              controller.model.isSuccessState.value = false;
                                                              controller.model.isErrorState.value = false;
                                                              Get.toNamed(AppRoutes.signupPageScreen);
                                                            },
                                                            child: Text(
                                                              "msg_sign_up_for_free"
                                                                  .tr,
                                                              style: CustomTextStyles.homeTitleLargeDMSans
                                                                  .copyWith(
                                                                decoration: TextDecoration
                                                                    .underline,
                                                              ),),
                                                          )
                                                        ]
                                                    )
                                                  ]
                                              )
                                          ),
                                        ),
                                      ),
                                    )
                                  ]
                              )
                          ),
                        ),
                      ],
                    )
                )
            )
        )
    );
  }
}

