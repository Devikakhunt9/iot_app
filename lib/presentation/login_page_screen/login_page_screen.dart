import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/utils/api.dart';
import 'package:iot_application1/presentation/Authentication/forget_password_screen/forget_password_page.dart';
import 'package:iot_application1/presentation/Shared%20Prefrences/shared_prefrences.dart';
// import 'package:iot_application1/urls/urls_page.dart';
import 'package:iot_application1/widgets/Auth_Widgets/orDivder.dart';
import 'package:iot_application1/widgets/glassmorp_obj.dart';
import 'package:iot_application1/widgets/glassmorph_bg.dart';

import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Authentication/signup_page_screen/singup_page_screen.dart';
import '../Homepage/HomePage/home.dart';
import 'controller/login_page_controller.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/utils/validation_functions.dart';
import 'package:iot_application1/widgets/custom_elevated_button.dart';
import 'package:iot_application1/widgets/custom_floating_text_field.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import RxSwift;

// ignore_for_file: must_be_immutable
// class LoginPageScreen extends GetWidget<LoginPageController> {
class LoginPageScreen extends StatefulWidget{
  LoginPageScreen({Key? key}) : super(key: key);

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LoginPageController controller = LoginPageController();
  // bool isLoading = false;

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');

    if (!isEmailValid) {
      return 'please enter a valid email';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        //.g,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    // AutoHeight au = AutoHeight(context);
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
              )),
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
                            'Welcome Back!',
                            style: GoogleFonts.plusJakartaSans(
                              color: Colors.white,
                              fontSize: 32,
                              wordSpacing: 1.2,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Welcome back we missed you.',
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
                                "Username",
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
                              validator: validateEmail,
                              controller: controller.emailController,
                              style: GoogleFonts.plusJakartaSans(
                                  color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Username',
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
                                  if (value!.isEmpty) {
                                    return "please Enter your password";
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
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                child: Text(
                                  "Forgot Password?",
                                  style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                                onTap: () {
                                  Get.to(ForgetPasswordPage());
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 26.0),
                          Container(
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
                                if (_formKey.currentState!.validate()) {
                                 logIN(controller.emailController.obs, controller.passwordController.obs);

                                }
                              },
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.symmetric(vertical: 12.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                              ),
                              child: Text(
                                'Sign in',
                                style: GoogleFonts.plusJakartaSans(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          Spacer(),
                          GestureDetector(
                            onTap: () {

                                Get.to(SignupPageScreen());


                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'DON\'T HAVE AN ACCOUNT?',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w700,
                                      color: CustomTextStyles.lightTextColor,
                                      fontSize: 12.0),
                                ),
                                Text(
                                  '  SIGN UP',
                                  style: GoogleFonts.plusJakartaSans(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
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
              )),
        ],
      ),
    );
  }

  Future<dynamic> logIN(Rx<TextEditingController> email, Rx<TextEditingController> pass) async {
    setState(() {
      controller.model.isLoading = true.obs;  // Add this line
    });
    print('login Function Called');
    print("$email ::: $pass ::::");
    final String apiUrl = '${API.loginApi}';
    try {


      var map = Map<String, dynamic>();
      map['username'] = email.value.text;
      map['password'] = pass.value.text;
      var res = await http.post(Uri.parse(apiUrl), body: map, );
      print("Data sent");
      if (res.statusCode == 200) {
        print('Success: ${res.body}');
      } else if (res.statusCode == 400) {
        print('Client Error: ${res.body}');
      } else {
        print('Server Error: ${res.statusCode}');
        print(jsonDecode(res.body.toString())['detail']);
      }
      if(jsonDecode(res.body)['status']=='success'){
        await SharedPreferencesHelper.saveEmail(email.value.toString());
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) =>
        //     const AskMobileNumberPage(),
        //   ),
        // );
        print("REsponse Got :");
      }
      return res;
    } catch (e, stackTrace) {
      // print(jsonDecode(res.body))
      print('Error: $e');
      print('StackTrace: $stackTrace');
      return null;
    }finally {

      setState(() {
        controller.model.isLoading =  false.obs;  // Add this line
      });
    }
  }
}
