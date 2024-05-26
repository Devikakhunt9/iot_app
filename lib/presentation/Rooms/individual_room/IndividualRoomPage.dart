import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/temp_card.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/title_widget.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/top_bar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_device_card.dart';

class IndividualRoomPage extends StatelessWidget {
  IndividualRoomPage({Key? key}) : super(key: key);

  List<CustomDeviceCard> devices = [
    CustomDeviceCard(
      deviceName: "Lamp",
      roomName: "Living Room",
      switchStatus: true,
    ),
    CustomDeviceCard(
        deviceName: "Speaker", roomName: "Living Room", switchStatus: false),
    CustomDeviceCard(
        deviceName: "Light", roomName: "Living Room", switchStatus: true),
    CustomDeviceCard(
        deviceName: "Bulb", roomName: "Living Room", switchStatus: false)
  ];
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 60,
            ),

            ///App bar TOP
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 4),
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              
                
              ],
            ),
            SizedBox(
              height: 20,
            ),

            ///Top Bar
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 2, right: screenWidth * 2),
              child: TopBar("Living Room", "4 devices",
                  "assets/images/home.jpeg"),
            ),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///TempCard
            // TempCard("Living Room".tr, "25"),
            // SizedBox(
            //   height: screenHeight * 2,
            // ),

            ///Title
            IndTitleWidget("lbl_home_your_device".tr, "10", true),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///Grid View
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: screenHeight * 2,
              padding: EdgeInsets.only(
                  left: screenWidth * 2, right: screenWidth * 2),
              children: List.generate(4, (index) {
                return Center(child: devices[index]);
              }),
            ),
            SizedBox(
              height: screenHeight * 5,
            )
          ],
        ),
      ),
    );
  }
}




