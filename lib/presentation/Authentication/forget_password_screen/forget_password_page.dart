import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/utils/api.dart';
import 'package:iot_application1/presentation/Authentication/forget_password_screen/controller/forget_password_controller.dart';

import 'package:flutter/material.dart';
import 'package:iot_application1/presentation/Authentication/otp/otp_page.dart';
import 'package:http/http.dart' as http;
import 'package:iot_application1/presentation/Shared%20Prefrences/shared_prefrences.dart';

class ForgetPasswordPage extends GetWidget<ForgetPasswordController> {
  ForgetPasswordPage({Key? key}) : super(key: key);

  ForgetPasswordController controller = ForgetPasswordController();

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
              )),

          // Bottom Container
          Positioned(
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
                        'Forget password',
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 32,
                          wordSpacing: 1.2,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Forget password Vi-Smart Mobile Application Today',
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
                        child: TextField(
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
                      SizedBox(height: 24.0),
                      controller.isLoading.value
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
                                onPressed: () async {
                                  if (controller.emailController.value !=
                                      null) {
                                    await sendOTPForForgetPass(
                                        controller.emailController.value.text);
                                    Get.to(OtpPage());
                                  }
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                                child: Text(
                                  'Send OTP',
                                  style: GoogleFonts.plusJakartaSans(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                      SizedBox(height: 10.0),
                      Spacer(),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> sendOTPForForgetPass(String email) async {
    controller.isLoading.value = true;

    print('sign up Function Called');
    print("${email}");
    final String apiUrl = '${API.forgetPassApi}${email}';
    try {
      var map = Map<String, dynamic>();

      map['email'] = email;
      var res = await http.post(
        Uri.parse(apiUrl),
        body: map,
      );
      print("Data sent");
      if (res.statusCode == 200) {
        await SharedPreferencesHelper.saveEmail(email);
        Get.toNamed(AppRoutes.otpScreen);
      } else if (res.statusCode == 400) {
        print('Client Error: ${res.body}');
      } else {
        print('Error: ${res.statusCode}');

        //just for testing the code :

        await SharedPreferencesHelper.saveEmail(email);
        Get.toNamed(AppRoutes.otpScreen);

        print(jsonDecode(res.body.toString())['detail']);
      }
      return res;
    } catch (e, stackTrace) {
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return null;
    } finally {
      controller.isLoading.value = false;
    }
  }
}
