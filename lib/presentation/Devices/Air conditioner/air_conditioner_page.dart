import 'package:aagash_s_application1/presentation/Devices/Air%20conditioner/small_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/Device Widgets/device_appBar.dart';
import '../../../widgets/Device Widgets/device_display_widget.dart';
import '../../../widgets/Device Widgets/device_label.dart';
import '../../../widgets/Scenes_Widgets/scene_comp.dart';
import '../../../widgets/Scenes_Widgets/scene_container.dart';

class AirConditionerPage extends StatelessWidget {
  //const AirConditionerPage({super.key});

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
              child: DeviceAppBar(deviceName: "Air Conditioner",roomName: "Living Room"),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            ///Display Image
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
              heading: "Set Temperature",
              lastWidget: Container()
            ),
            SizedBox(
              height: screenHeight * 2,
            ),
            ///Circular controller
            SleekCircularSlider(
                min: 0,
                max: 30,
                initialValue: 15,
                innerWidget:  (val){
                  int value = val.toInt();
                  return Center(child: Text("$value \nTemp",style: CustomTextStyles.homeTitleLarge2DMSans,textAlign: TextAlign.center,));
                },
                appearance: CircularSliderAppearance(
                  size: screenHeight * 30,
                  customWidths: CustomSliderWidths(
                      progressBarWidth: 20,
                    shadowWidth: 10
                  ),
                  customColors: CustomSliderColors(
                    trackColor: PrimaryColors().orangeNormal.withOpacity(0.5),
                    //progressBarColor: PrimaryColors().orangeNormal,
                      progressBarColors: [Colors.purple,PrimaryColors().orangeNormal,Colors.red,],
                    shadowColor: PrimaryColors().orangeNormal

                  )
                ),
            ),
            ///Selection container
            Container(
              //color:  Colors.red,
              height: screenHeight * 12,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SmallButtons(Icons.wind_power, "Cold",true),
                    SmallButtons(Icons.wind_power, "Cold",false),
                    SmallButtons(Icons.wind_power, "Cold",false),
                    SmallButtons(Icons.wind_power, "Cold",false),
                    SmallButtons(Icons.wind_power, "Cold",false),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceDivider(size: 5,),
            SizedBox(
              height: screenHeight * 1,
            ),
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


