import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_application1/presentation/login_page_screen/login_page_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Get.offAll(LoginPageScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Color.fromARGB(255, 33, 9, 33),
      body: Center(
          child: Padding(
              padding: const EdgeInsets.all(58.0),
              child: Image.asset(
                "assets/images/logo.png",
                width: 140,
              ))),
    );
  }
}
