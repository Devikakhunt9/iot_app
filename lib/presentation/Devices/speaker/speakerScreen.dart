import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/widgets/Device%20Widgets/device_appBar.dart';
import 'package:aagash_s_application1/widgets/Device%20Widgets/device_display_widget.dart';
import 'package:aagash_s_application1/widgets/Device%20Widgets/device_label.dart';
import 'package:aagash_s_application1/widgets/Scenes_Widgets/scene_comp.dart';
import 'package:aagash_s_application1/widgets/Scenes_Widgets/scene_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpeakerScreen extends StatelessWidget {
  //const SpeakerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    Color outer = Theme.of(context).colorScheme.secondaryContainer;
    Color inner = Theme.of(context).colorScheme.background;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 4,
            ),
            ///Device app bar
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth*3),
                child: DeviceAppBar(deviceName: "Speaker",roomName: "Living Room"),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            ///Image Display
            DeviceDisplayWidget(image:"assets/images/speaker.png"),
            SizedBox(
              height: screenHeight * 1,
            ),
            ///Status
            DeviceLabel(
              heading: "Status",
              lastWidget: CupertinoSwitch(
                //inactiveTrackColor: PrimaryColors().gray500,
                offLabelColor: PrimaryColors().gray500,
                activeColor: PrimaryColors().orangeNormal,
                trackColor: PrimaryColors().gray500,
                value: false,
                onChanged: (value){
                  print("Change");
                  //switchStatus = !switchStatus;
                },
              ),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceDivider(size: 5,),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceLabel(
              heading: "Battery",
              lastWidget: Text("90%",style: CustomTextStyles.homeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceDivider(size: 5,),
            SizedBox(
              height: screenHeight * 1,
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            ///Volume for speaker
            DeviceLabel(
              heading: "Volume",
              lastWidget: Container()
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            ///Speaker slider
            Slider(
              min: 0.0,
              max: 100.0,
              value: 10,
              onChanged: (value) {
                // setState(() {
                //   _value = value;
                // });
              },
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceDivider(size: 5,),
            ///Scene heading
            Padding(
                padding: EdgeInsets.only(left: screenWidth * 4,right: screenWidth*4),
                child: DeviceSceneTitle(title: 'Scenes', toShowCount: true, count: '10',),
            ),
            SizedBox(
              height: screenHeight * 2,
            ),
            ///Scene container
            SceneContainer(
                scenes: [
                  SceneCompo(title: "Morning coffee", data: "Everyday | 08:15 AM - 9:00 AM"),
                  DeviceDivider(size: 2,),
                  SceneCompo(title: "Morning coffee", data: "Everyday | 08:15 AM - 9:00 AM"),
                  DeviceDivider(size: 2,),
                  SceneCompo(title: "Morning coffee", data: "Everyday | 08:15 AM - 9:00 AM"),
                ]
            ),
            SizedBox(
              height: screenHeight * 2,
            ),
          ],
        ),
      ),
    );
  }
}


