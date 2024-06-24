import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/utils/api.dart';
import 'package:iot_application1/presentation/Authentication/reset_password_screen/reset_pass_controller.dart';
import 'package:iot_application1/presentation/login_page_screen/login_page_screen.dart';
import 'package:iot_application1/theme/custom_text_style.dart';
import 'package:http/http.dart' as http;
import '../../Shared Prefrences/shared_prefrences.dart';


class ResetPassScreen extends StatefulWidget {
  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  ResetPassController controller = ResetPassController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // TextEditingController newPass = new TextEditingController();
  // TextEditingController confirmPass = new TextEditingController();
  //
  // bool isVisibleConfirm = false;
  // bool isVisibleNew = false;
  // bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Background Widget (Could be any content above the bottom container)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 33, 9, 33),
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
                  width: 140,
                )
              ],
            ),
          ),
          // Glass-like blur effect

          // Bottom Container
          Positioned(
              bottom: 0,
              left: 0,
              top: 240,
              right: 0,
              child: ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 11.0, sigmaY: 11.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(81, 81, 81, 0.4),
                      //  color: Colors.black.withOpacity(0.5),
                      // Semi-transparent black color
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 26,
                          ),
                          Text(
                            'Reset Password!',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 32,
                              wordSpacing: 1.2,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          // Text(
                          //   'Welcome back we missed you.',
                          //   style: GoogleFonts.plusJakartaSans(
                          //     color: CustomTextStyles.lightTextColor,
                          //     fontWeight: FontWeight.w600,
                          //     fontSize: 12.0,
                          //   ),
                          // ),
                          SizedBox(height: 22.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "New Password",
                                style: GoogleFonts.plusJakartaSans(
                                  color: CustomTextStyles.lightTextColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 6.0),
                         Obx(() => Container(
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
                             // validator: validateEmail,
                             obscureText: controller.isVisibleNew.value
                                 ? false
                                 : true,
                             controller: controller.newPass,
                             style: GoogleFonts.plusJakartaSans(
                                 color: Colors.white),
                             decoration: InputDecoration(
                               hintText: 'New Pass',
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
                                 "assets/icons/key.svg",
                                 height: 10,
                                 fit: BoxFit.scaleDown,
                               ),
                               suffixIcon: IconButton(
                                 icon: Icon(
                                   controller.isVisibleNew.value
                                       ? Icons.visibility
                                       : Icons.visibility_off,
                                   color: Colors.white,
                                 ),
                                 onPressed: () {
                                   controller.isVisibleNew.value = !controller.isVisibleNew.value;
                                 },
                               ),
                             ),
                           ),
                         )) ,
                          SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Confirm Password",
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
                                  if (value!.isEmpty) {
                                    return "please Enter your password";
                                  }
                                  return null;
                                },
                                controller: controller.ConfirmPass,
                                obscureText: controller.isVisibleConfirm.value
                                    ? false
                                    : true,
                                style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: 'Confirm Password',
                                  isDense: true,
                                  hintStyle: GoogleFonts.plusJakartaSans(
                                      color: Colors.white.withOpacity(0.5),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.3),
                                        width: 1),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.3),
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
                                      controller.isVisibleConfirm.value
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      controller.isVisibleConfirm.value = !controller.isVisibleConfirm.value;
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.end,
                          //   children: [
                          //     GestureDetector(
                          //       child: Text(
                          //         "Forgot Password?",
                          //         style: GoogleFonts.plusJakartaSans(
                          //           color: Colors.white,
                          //           fontWeight: FontWeight.w400,
                          //           fontSize: 12,
                          //         ),
                          //       ),
                          //       onTap: () {
                          //         Get.to(LoginPageScreen());
                          //       },
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 26.0),
                          Obx(
                            () => controller.isloading.value
                                ? CircularProgressIndicator()
                                : Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.deepPurpleAccent,
                                          Colors.redAccent
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        if (_formKey.currentState!
                                            .validate()) {
                                          resetPass();
                                        }
                                      },
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                      ),
                                      child: Text(
                                        'confirm',
                                        style: GoogleFonts.plusJakartaSans(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                          ),
                          Spacer(),
                          // GestureDetector(
                          //   onTap: () {
                          //     // Get.to(SignupPageScreen());
                          //   },
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.center,
                          //     children: [
                          //       Text(
                          //         'DON\'T HAVE AN ACCOUNT?',
                          //         style: GoogleFonts.plusJakartaSans(
                          //             fontWeight: FontWeight.w700,
                          //             color: CustomTextStyles.lightTextColor,
                          //             fontSize: 12.0),
                          //       ),
                          //       Text(
                          //         '  SIGN UP',
                          //         style: GoogleFonts.plusJakartaSans(
                          //             fontWeight: FontWeight.w700,
                          //             color: Colors.white,
                          //             fontSize: 12.0),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ),),
        ],
      ),
    );
  }


  Future<dynamic> resetPass() async {
    print("REset function called:::${controller.newPass.value.text} ::: ${controller.ConfirmPass.value.text}");
    controller.isloading.value = true;
    String? email = await SharedPreferencesHelper.getEmailValue();
    String? otpValue = await SharedPreferencesHelper.getOtpValue();
    final String apiUrl = '${API.forgetPassOTPApi}$email?otp=$otpValue';
    try {
      var map = Map<String, dynamic>();
      map['password'] = controller.newPass.value.text;
      map['confirm_password'] = controller.ConfirmPass.value.text;
      var res = await http.patch(
        Uri.parse('${apiUrl}'),
        body: map,
      );
      print("Data sent :::${apiUrl}");
      if (res.statusCode == 200) {
        // await SharedPreferencesHelper.saveEmail(email.value.text);
        // SharedPreferences pref = SharedPreferences.getInstance();
        // await pref.setBool('isLogin', true);
        if (otpValue!.isNotEmpty || otpValue != null) {
          Get.offAll(LoginPageScreen());
        }
      } else if (res.statusCode == 400) {
        print('Client Error: ${res.body}');
      } else {
        print('Server Error: ${res.statusCode}');

        //for testing :::
        if (otpValue!.isNotEmpty || otpValue != null) {
          Get.offAll(LoginPageScreen());
        }
        print(jsonDecode(res.body.toString())['detail']);
      }
      return res;
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return null;
    } finally {
      controller.isloading.value = false;
    }
  }
}
