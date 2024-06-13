import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/network/api_connection.dart';
import 'package:iot_application1/presentation/Authentication/otp/controller/otp_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:iot_application1/presentation/Homepage/HomePage/home.dart';
import 'package:iot_application1/presentation/Shared%20Prefrences/shared_prefrences.dart';
import 'package:iot_application1/presentation/login_page_screen/login_page_screen.dart';
import 'package:iot_application1/widgets/Auth_Widgets/otp_text_box.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/utils/api.dart';
import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/glassmorp_obj.dart';
import '../../../widgets/glassmorph_bg.dart';
import 'package:http/http.dart' as http;

class OtpPage extends GetWidget<OtpController> {
  OtpPage({Key? key}) : super(key: key);

  OtpController controller = OtpController();
  RxString errorCode = "".obs;
  String otpValue = '';
  bool isLoading = false;

  late Timer _timer;
  int seconds = 15;

  void _startTimer() {
    const oneSec = Duration(seconds: 15);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        controller.seconds.value--;
      },
    );
  }

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
                        'OTP Verfication',
                        style: GoogleFonts.plusJakartaSans(
                          color: Colors.white,
                          fontSize: 32,
                          wordSpacing: 1.2,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Send OTP with Vi-Smart Mobile Application Today',
                        style: GoogleFonts.plusJakartaSans(
                          color: CustomTextStyles.lightTextColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 12.0,
                        ),
                      ),
                      SizedBox(height: 22.0),
                      Form(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            OtpBox(
                              onOtpChanged: (value) {
                                otpValue = value; // Receive the OTP value here
                              },
                            ),
                            OtpBox(
                              onOtpChanged: (value) {
                                otpValue += value; // Receive the OTP value here
                              },
                            ),
                            OtpBox(
                              onOtpChanged: (value) {
                                otpValue += value; // Receive the OTP value here
                              },
                            ),
                            OtpBox(
                              onOtpChanged: (value) {
                                otpValue += value; // Receive the OTP value here
                              },
                            ),
                            OtpBox(
                              onOtpChanged: (value) {
                                otpValue += value; // Receive the OTP value here
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'DON\'T HAVE Recived OTP?',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                color: CustomTextStyles.lightTextColor,
                                fontSize: 12.0),
                          ),
                          Text(
                            '  Resend',
                            style: GoogleFonts.plusJakartaSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 12.0),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Obx(
                        () => controller.isLoading.value
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
                                    otpVerification();
                                    // Get.offAll(HomePage());
                                  },
                                  style: TextButton.styleFrom(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0),
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
                      )
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

  Future<dynamic> otpVerification() async {
    controller.isLoading.value = true;
    String? email = await SharedPreferencesHelper.getEmailValue();
    print(otpValue + ':::: ${email}');
    final String apiUrl = '${API.otpVerficarionApi}';
    try {
      var map = Map<String, dynamic>();
      map['username'] = email;
      map['otp'] = otpValue;
      var res = await http.patch(
        Uri.parse('${apiUrl}$email?$otpValue'),
        body: map,
      );
      print("Data sent :::${apiUrl}$email?$otpValue");
      if (res.statusCode == 200) {
        // await SharedPreferencesHelper.saveEmail(email.value.text);
        // SharedPreferences pref = SharedPreferences.getInstance();
        // await pref.setBool('isLogin', true);
        if (otpValue.isNotEmpty || otpValue != null) {
          Get.offAll(HomePage());
        }
      } else if (res.statusCode == 400) {
        print('Client Error: ${res.body}');
      } else {
        print('Server Error: ${res.statusCode}');

        //for testing :::
        if (otpValue.isNotEmpty || otpValue != null) {
          Get.offAll(HomePage());
        }
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
