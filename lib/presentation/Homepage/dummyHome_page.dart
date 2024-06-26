
import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Bar%20Chart/CustomBarGraph.dart';
import 'package:iot_application1/presentation/Bar%20Chart/dummyChart.dart';
import 'package:iot_application1/widgets/custom_elevated_button.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class DummyHomePage extends StatefulWidget {
  @override
  State<DummyHomePage> createState() => _DummyHomePageState();
}

class _DummyHomePageState extends State<DummyHomePage> {
  ///FirebaseAuth auth = FirebaseAuth.instance;

  Widget signOutButton() {
    return CustomElevatedButton(
      text: "Sign Out",
      onPressed: () async {
      //  await auth.signOut();
        Get.toNamed(AppRoutes.loginPageScreen);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ///Change this dummy data according to the api call
    DummyChartData dummyData = DummyChartData();

    AutoHeight au =AutoHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
          child: SizedBox(
              height: screenHeight * 50,
              child: CustomBarGraph(
                data: dummyData.weeklyUse,
                yValue: 100,
              )
          )
      )
    );
  }
}
