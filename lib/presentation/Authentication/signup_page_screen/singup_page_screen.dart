import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/network/api_connection.dart';
import 'package:iot_application1/core/utils/validation_functions.dart';
import 'package:iot_application1/presentation/Authentication/signup_page_screen/controller/signup_controller.dart';
import 'package:iot_application1/presentation/Shared%20Prefrences/shared_prefrences.dart';
import 'package:iot_application1/widgets/Auth_Widgets/orDivder.dart';
import 'package:iot_application1/widgets/custom_elevated_button.dart';
import 'package:iot_application1/widgets/custom_floating_text_field.dart';

import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import '../../../core/utils/api.dart';
import '../../../widgets/custom_checkbox_button.dart';
import '../../../widgets/glassmorp_obj.dart';
import '../../../widgets/glassmorph_bg.dart';
import '../../login_page_screen/controller/login_page_controller.dart';
import '../../login_page_screen/login_page_screen.dart';
import 'package:http/http.dart' as http;

class SignupPageScreen extends GetWidget<SignupPageController> {
  SignupPageScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SignupPageController controller = SignupPageController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        // statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Widget (Could be any content above the bottom container)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 33, 9, 33),
              // color: Colors.green,
                image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.contain,
                    image: AssetImage(
                      "assets/images/Objects.png",
                    ))),
            child: Column(
              children: [
                SizedBox(
                  height: 80,
                ),
                Image.asset(
                  "assets/images/logo.png",
                  width: 100,
                )
              ],
            ),
          ),

          // Bottom Container
          Form(
            key: _formKey,
            child: Positioned(
              bottom: 0,
              left: 0,
              top: 200,
              right: 0,
              child: ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 11.0, sigmaY: 11.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(81, 81, 81, 0.4),
                      // color: Colors.pink,
                      //  color: Colors.black.withOpacity(0.5),
                      // Semi-transparent black color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 26,
                        ),
                        Text(
                          'Get Started Free',
                          style: GoogleFonts.plusJakartaSans(
                            color: Colors.white,
                            fontSize: 32,
                            wordSpacing: 1.2,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Signup with Vi-Smart Mobile Application Today',
                          style: GoogleFonts.plusJakartaSans(
                            color: CustomTextStyles.lightTextColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.0,
                          ),
                        ),
                        SizedBox(height: 22.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Email Address",
                              style: GoogleFonts.plusJakartaSans(
                                color: CustomTextStyles.lightTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(255, 255, 255, 0.1),
                              Color.fromRGBO(255, 255, 255, 0.2),
                              Color.fromRGBO(255, 255, 255, 0.1),
                              Color.fromRGBO(255, 255, 255, 0.04),
                            ]),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if (value == null || (!isValidEmail(value, isRequired: true))) {
                                return "err_msg_please_enter_valid_email".tr;
                              }
                              return null;
                            },
                            controller: controller.emailController,
                            style:
                                GoogleFonts.plusJakartaSans(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: 'yourname@mail.com',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              isDense: true,
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/user.svg",
                                height: 10,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Your name",
                              style: GoogleFonts.plusJakartaSans(
                                color: CustomTextStyles.lightTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(255, 255, 255, 0.1),
                              Color.fromRGBO(255, 255, 255, 0.2),
                              Color.fromRGBO(255, 255, 255, 0.1),
                              Color.fromRGBO(255, 255, 255, 0.04),
                            ]),
                          ),
                          child: TextFormField(
                            validator: (value) {
                              if(value!.isEmpty){
                                return "Enter your name";
                              }
                              return null;

                            },
                            controller: controller.nameController,
                            style:
                                GoogleFonts.plusJakartaSans(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: '@yourname',
                              hintStyle: GoogleFonts.plusJakartaSans(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromRGBO(255, 255, 255, 0.3),
                                    width: 1),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              isDense: true,
                              prefixIcon: SvgPicture.asset(
                                "assets/icons/user.svg",
                                height: 10,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 12.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       "Mobile No",
                        //       style: GoogleFonts.plusJakartaSans(
                        //         color: CustomTextStyles.lightTextColor,
                        //         fontSize: 14,
                        //         fontWeight: FontWeight.w600,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 6.0),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10.0),
                        //     gradient: LinearGradient(colors: [
                        //       Color.fromRGBO(255, 255, 255, 0.1),
                        //       Color.fromRGBO(255, 255, 255, 0.2),
                        //       Color.fromRGBO(255, 255, 255, 0.1),
                        //       Color.fromRGBO(255, 255, 255, 0.04),
                        //     ]),
                        //   ),
                        //   child: TextFormField(
                        //     controller: controller.phoneNumberController,
                        //     style:
                        //         GoogleFonts.plusJakartaSans(color: Colors.white),
                        //     decoration: InputDecoration(
                        //       hintText: 'xxxxxxxxx',
                        //       hintStyle: GoogleFonts.plusJakartaSans(
                        //           color: Colors.white.withOpacity(0.5),
                        //           fontSize: 14,
                        //           fontWeight: FontWeight.w600),
                        //       enabledBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //             color: Color.fromRGBO(255, 255, 255, 0.3),
                        //             width: 1),
                        //         borderRadius: BorderRadius.circular(10.0),
                        //       ),
                        //       focusedBorder: OutlineInputBorder(
                        //         borderSide: BorderSide(
                        //             color: Color.fromRGBO(255, 255, 255, 0.3),
                        //             width: 1),
                        //         borderRadius: BorderRadius.circular(10.0),
                        //       ),
                        //       isDense: true,
                        //       prefixIcon: SvgPicture.asset(
                        //         "assets/icons/user.svg",
                        //         height: 10,
                        //         fit: BoxFit.scaleDown,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 6.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Password",
                              style: GoogleFonts.plusJakartaSans(
                                color: CustomTextStyles.lightTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 6.0),
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(255, 255, 255, 0.1),
                                Color.fromRGBO(255, 255, 255, 0.2),
                                Color.fromRGBO(255, 255, 255, 0.1),
                                Color.fromRGBO(255, 255, 255, 0.04),
                              ]),
                            ),
                            child: TextFormField(
                              validator: (value) {
                                if(value!.isEmpty){
                                  return "Enter the Password";
                                }
                                else if(value!.isNotEmpty && value!.length<8){
                                  return "Password must be 8 Charecters";
                                }
                                return null;
                              },
                              controller: controller.passwordController,
                              obscureText:
                                  controller.isVisible.value ? false : true,
                              style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Password',
                                isDense: true,
                                hintStyle: GoogleFonts.plusJakartaSans(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 255, 255, 0.3),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 255, 255, 0.3),
                                      width: 1),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                prefixIcon: SvgPicture.asset(
                                  "assets/icons/key.svg",
                                  height: 10,
                                  fit: BoxFit.scaleDown,
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    controller.isVisible.value
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    controller.isVisible.value =
                                        !controller.isVisible.value;
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 26.0),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.end,
                        //   children: [
                        //     Text(
                        //       "Forgot Password?",
                        //       style: GoogleFonts.plusJakartaSans(
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w400,
                        //         fontSize: 12,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // SizedBox(height: 26.0),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.deepPurpleAccent, Colors.redAccent],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: TextButton(
                            onPressed: () {
                              print("go to OTP/");
                              if(_formKey.currentState!.validate()){
                                signUp(controller.emailController.text, controller.nameController.text, controller.passwordController.text);
                                Get.toNamed(AppRoutes.otpScreen);
                              }

                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'By registering you with our ',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w700,
                                  color: CustomTextStyles.lightTextColor,
                                  fontSize: 11.0),
                            ),
                            Text(
                              ' Terms and Conditions',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w700,
                                  color: Color.fromRGBO(157, 92, 233, 1),
                                  fontSize: 11.0),
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.to(LoginPageScreen());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'HAVE AN ACCOUNT?',
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w700,
                                    color: CustomTextStyles.lightTextColor,
                                    fontSize: 12.0),
                              ),
                              Text(
                                '  SIGN IN',
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w700,
                                    color: Color.fromARGB(255, 244, 97, 44),
                                    fontSize: 12.0),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //   return SafeArea(
  //     child: Scaffold(
  //       resizeToAvoidBottomInset: true,
  //       backgroundColor: Theme.of(context).colorScheme.background,
  //       ///Form box
  //       body: Form(
  //         key: _formKey,
  //         child: SizedBox(
  //           height: 850.v,
  //           width: double.maxFinite,
  //           child: Stack(
  //             alignment: Alignment.center,
  //             fit: StackFit.expand,
  //             children: [
  //               ///BG effects
  //               Column(
  //                 children: [
  //                   GlassMorpObj(t: 30,b: 0,l: 2,r: 0,sH: screenHeight * 10,sW: screenWidth * 20,),
  //                   GlassMorpObj(t: 15,b: 0,l: 0,r: 10,alignment: Alignment.topRight),
  //                 ],
  //               ),
  //               GlassMorpObj(t: 15,b: 0,l: 15,r: 2,alignment: Alignment.topRight,sH: screenHeight * 15,sW: screenWidth * 25,),
  //               GlassMorpObj(t: 3,b: 0,l: 15,r: 2,),
  //               GlassMorpObj(t: 60,b: 0,l: 2,r: 0,sH: screenHeight * 15,sW: screenWidth * 25,),
  //               GlassMorpObj(t: 80,b: 0,l: 40,r: 0,sH: screenHeight * 15,sW: screenWidth * 25,),
  //               GlassMorphBg(),

  //               Align(
  //                 alignment: Alignment.center,
  //                 child: SingleChildScrollView(
  //                   child: Container(
  //                     padding: EdgeInsets.symmetric(
  //                       horizontal: screenWidth*5,
  //                       vertical: screenHeight*6,
  //                     ),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadiusStyle.roundedBorder40,
  //                     ),
  //                     child: Column(
  //                       mainAxisSize: MainAxisSize.min,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         // SizedBox(height: screenHeight*0.8),
  //                         ClipRRect(
  //                           child: BackdropFilter(
  //                             filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
  //                             child: Container(
  //                               height: screenHeight*86,
  //                               width: screenWidth*100,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(15),
  //                                 gradient: LinearGradient(
  //                                   colors: [
  //                                     Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.5),
  //                                     Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.4),
  //                                   ],
  //                                   begin: AlignmentDirectional.topStart,
  //                                   end: AlignmentDirectional.bottomEnd,
  //                                 ),
  //                                 // color: Colors.red,
  //                                 border: GradientBoxBorder(
  //                                   gradient: LinearGradient(colors: [appTheme.black900,
  //                                     appTheme.orange900,]),
  //                                   width: 3,
  //                                 ),
  //                               ),
  //                               child: Container(
  //                                 width: 334.h,
  //                                 padding: EdgeInsets.symmetric(
  //                                   horizontal: 18.h,
  //                                   vertical: screenHeight*2,
  //                                 ),
  //                                 decoration: AppDecoration.outline.copyWith(
  //                                   borderRadius:
  //                                   BorderRadiusStyle.roundedBorder40,
  //                                   color: Colors.transparent
  //                                 ),
  //                                 child: Column(
  //                                   mainAxisSize: MainAxisSize.min,
  //                                   mainAxisAlignment: MainAxisAlignment.center,
  //                                   children: [
  //                                     SizedBox(height: screenHeight*1),
  //                                     ///Signup text
  //                                     Text(
  //                                       "lbl_sign_up".tr,
  //                                       style: Theme.of(context).textTheme.headlineLarge,
  //                                     ),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Signup to manage text
  //                                     Text(
  //                                       "msg_sign_up_to_manage".tr,
  //                                       textAlign: TextAlign.center,
  //                                       style: CustomTextStyles.titleSmallDMSansBluegray900
  //                                     ),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Email text field
  //                                     _buildEmail(context),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Phone Number text field
  //                                     _buildPhoneNumber(context),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Password text field
  //                                     _buildPassword(context),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Remember radio button
  //                                     _buildRememberInformation(),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Error message
  //                                     Obx(() =>
  //                                         Visibility(
  //                                           visible: controller.model.isErrorState.value,
  //                                           child: Text(
  //                                               controller.errorCode.value,
  //                                               style: CustomTextStyles
  //                                                   .errorTitleSmallDMSansBluegray90001
  //                                           ),
  //                                         )
  //                                     ),
  //                                     SizedBox(height: screenHeight*2),
  //                                     ///Signup button
  //                                     _buildSignUp(),
  //                                     SizedBox(height: screenHeight*2),
  //                                     OrDivider(),
  //                                     SizedBox(height: screenHeight*1.5),
  //                                     ///Already have an account text
  //                                     Align(
  //                                       alignment: Alignment.center,
  //                                       child: Padding(
  //                                         padding: EdgeInsets.only(
  //                                           left: screenWidth*1,
  //                                           right: screenWidth*1,
  //                                         ),
  //                                         child: Row(
  //                                           mainAxisAlignment: MainAxisAlignment.center,
  //                                           children: [
  //                                             Text(
  //                                               "msg_already_have_an".tr,
  //                                               style: CustomTextStyles.titleSmallDMSansBluegray900
  //                                             ),
  //                                             ///Redirect to login text field
  //                                             Padding(
  //                                               padding:
  //                                               EdgeInsets.only(left: screenWidth*1),
  //                                               child: GestureDetector(
  //                                                 onTap: (){
  //                                                   print("Towards login page.....");
  //                                                   controller.emailController.clear();
  //                                                   controller.phoneNumberController.clear();
  //                                                   controller.passwordController.clear();
  //                                                   Get.toNamed(AppRoutes.loginPageScreen);
  //                                                 },
  //                                                 child: Text(
  //                                                   "lbl_login".tr,
  //                                                   style: CustomTextStyles.homeTitleLargeDMSans
  //                                                       .copyWith(
  //                                                     decoration: TextDecoration
  //                                                         .underline,
  //                                                   ),
  //                                                 ),
  //                                               ),
  //                                             ),
  //                                           ],
  //                                         ),
  //                                       ),
  //                                     ),
  //                                     SizedBox(height: screenHeight*1),
  //                                   ],
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  /// Section Widget - For Email
  Widget _buildEmail(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomFloatingTextField(
        context: context,
        controller: controller.emailController,
        labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
        labelText: "lbl_user_email_com".tr,
        textInputType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || (!isValidEmail(value, isRequired: true))) {
            return "err_msg_please_enter_valid_email".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget - For name
  Widget _buildName(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomFloatingTextField(
        context: context,
        controller: controller.nameController,
        labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
        labelText: "lbl_user_name_com".tr,
        textInputType: TextInputType.name,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null) {
            return "err_msg_please_enter_valid_name".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget -  For Phone Number
  Widget _buildPhoneNumber(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.h),
      child: CustomFloatingTextField(
        context: context,
        controller: controller.phoneNumberController,
        labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
        labelText: "lbl_phone_number".tr,
        textInputType: TextInputType.phone,
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || !isValidPhoneNumber(value)) {
            return "err_msg_please_enter_valid_number".tr;
          }
          return null;
        },
      ),
    );
  }

  /// Section Widget -  Password
  Widget _buildPassword(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(right: 8.h),
        child: Obx(
          () => CustomFloatingTextField(
            context: context,
            controller: controller.passwordController,
            labelText: "lbl_password".tr,
            labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
            // hintText: "lbl_password".tr,
            textInputAction: TextInputAction.done,
            textInputType: TextInputType.visiblePassword,
            obscureText: controller.isVisible.value ? false : true,
            suffix: GestureDetector(
                onTap: () {
                  controller.isVisible.value = !controller.isVisible.value;
                },
                child: controller.isVisible.value
                    ? Icon(
                        Icons.visibility,
                        color: PrimaryColors().orangeNormal,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: PrimaryColors().orangeNormal,
                      )),
            validator: (value) {
              if (value == null ||
                  (!isValidPassword(value, isRequired: true))) {
                return "err_msg_please_enter_valid_password".tr;
              }
              return null;
            },
          ),
        ));
  }

  /// Section Widget - Remember Me
  Widget _buildRememberInformation() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Obx(
        () => CustomCheckboxButton(
          alignment: Alignment.centerLeft,
          text: "msg_remember_information".tr,
          value: controller.rememberInformation.value,
          textStyle: CustomTextStyles.titleSmallDMSansBluegray900,
          onChange: (value) {
            controller.rememberInformation.value = value;
          },
        ),
      ),
    );
  }

  /// Button Section Widget - SignUp button
  Widget _buildSignUp() {
    return Obx(() => controller.model.isLoadingState.value
        ? Center(
            child: const CircularProgressIndicator(),
          )
        : CustomElevatedButton(
            text: "lbl_sign_up".tr,
            margin: EdgeInsets.only(right: 8.h),
            onPressed: () async {
              print("sign up page clicked.......");
              if (_formKey.currentState!.validate()) {
                controller.isLoadingState();
                try {
                  // UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
                  //   email: controller.emailController.text.trim(),
                  //   password: controller.passwordController.text.trim(),
                  // );
                  // /// Store phone number in Firestore or Realtime Database
                  // await _firestore.collection('users').doc(userCredential.user!.uid).set({
                  //   'phoneNumber': controller.phoneNumberController.text.trim(),
                  // });
                  // controller.onLoadingDone();
                  ApiConnection api = ApiConnection();
                  try {
                    var body = {
                      "email": controller.emailController.text.trim().toString()
                    };
                    var response = await api.post(API.generateOtp, body);
                    print(response.toString());
                    print("OTP message sent for verification!!");
                    Get.toNamed(AppRoutes.otpScreen, arguments: {
                      'email': controller.emailController.text.trim(),
                      'password': controller.passwordController.text.trim(),
                      'phoneNumber':
                          controller.phoneNumberController.text.trim(),
                      'name':controller.nameController.text.trim(),
                    });
                    controller.onLoadingDone();
                    controller.emailController.clear();
                    controller.phoneNumberController.clear();
                    controller.passwordController.clear();
                  } catch (e) {
                    controller.errorCode.value =
                        "There some problem with OTP Verification";
                    print(
                        "There is exception in the SignUp verification OTP API");
                  }
                  print("Move to next Page.....!!!!");
                } catch (e) {
                  // Handle signup errors
                  print('Signup failed: $e');
                  switch (e) {
                    case 'email-already-in-use':
                      controller
                          .isErrorState('The email address is already in use.');
                      break;
                    case 'weak-password':
                      controller
                          .isErrorState('The password provided is too weak.');
                      break;
                    case 'invalid-email':
                      controller.isErrorState('TThe email address is invalid.');
                      break;
                    case 'operation-not-allowed':
                      controller.isErrorState('Operation not allowed.');
                      break;
                    default:
                      controller.isErrorState('Sign-up failed');
                      break;
                  }
                  controller.onLoadingDone();
                  // Show error message to the user if needed
                  // Example:
                  // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Signup failed: $e')));
                }
                //Navigator.push(context, MaterialPageRoute(builder: (context) => DummyHomePage()));
              }
            },
          ));
  }

  Future<dynamic> signUp(String email,String name,String pass) async {
    controller.model.isLoadingState.value = true;

    print('login Function Called');
    print("$email ::: $pass :::: $name");
    final String apiUrl = '${API.signInApi}';
    try {
      var map = Map<String, dynamic>();
      map['name'] = name;
      map['email'] = email;
      map['password'] = pass;
      var res = await http.post(
        Uri.parse(apiUrl),
        body: map,
      );
      print("Data sent");
      if (res.statusCode == 200) {
        // await SharedPreferencesHelper.saveEmail(email.value.toString());
        // SharedPreferences pref = SharedPreferences.getInstance();
        // await pref.setBool('isLogin', true);
      } else if (res.statusCode == 400) {
        print('Client Error: ${res.body}');
      } else {
        print('Server Error: ${res.statusCode}');
        print(jsonDecode(res.body.toString())['detail']);
      }
      return res;
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return null;
    } finally {
      controller.model.isLoadingState.value = false;
    }
  }
}
