import 'dart:convert';
import 'dart:ffi';

import 'package:iot_application1/core/mqtt/mqtt_service.dart';
import 'package:iot_application1/presentation/Devices/Air%20conditioner/small_btn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iot_application1/presentation/Homepage/HomePage/controller/homeController.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/IndividualRoomPage.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/Device Widgets/device_appBar.dart';
import '../../../widgets/Device Widgets/device_display_widget.dart';
import '../../../widgets/Device Widgets/device_label.dart';
import '../../../widgets/Scenes_Widgets/scene_comp.dart';
import '../../../widgets/Scenes_Widgets/scene_container.dart';
import '../../Shared Prefrences/shared_prefrences.dart';

class AirConditionerPage extends StatefulWidget {
  @override
  State<AirConditionerPage> createState() => _AirConditionerPageState();
}

class _AirConditionerPageState extends State<AirConditionerPage> {
  HomeController controller = new HomeController();

  //const AirConditionerPage({super.key});
  MqttService mqttService = new MqttService();
  int pubDimmerValue = 0;
  double dimmer = 0;
  String msgMqttResponse = '';

  @override
  void initState() {
    super.initState();
    mqttService.connect();
    getDimmer();
  }

  Future<void> getDimmer() async {
    int? nullableIntValue = await SharedPreferencesHelper.getDimmers();
     msgMqttResponse = await SharedPreferencesHelper.getRelayValue().toString();
    double storedDimmer = nullableIntValue!.toDouble();
    if (storedDimmer != null) {
      setState(() {
        dimmer = storedDimmer;
      });
    }
  }

  @override
  void dispose() {
    mqttService.disconnect();
    super.dispose();
  }

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
              padding: EdgeInsets.only(
                  left: screenWidth * 3, right: screenWidth * 3),
              child: DeviceAppBar(
                  deviceName: "Air Conditioner", roomName: "Living Room"),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),

            ///Display Image
            DeviceDisplayWidget(image: "assets/images/speaker.png"),
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
                value:  controller.devices[0]['switchStatus'],
                // value: true,
                onChanged: (value) {
                  controller.changeSwtich(0);
                  // controller.devices[0]["switchStatus"] = !controller.devices[0]["switchStatus"];
                  //switchStatus = !switchStatus;
                },
              ),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceDivider(
              size: 5,
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceLabel(heading: "Set Temperature", lastWidget: Container()),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///Circular controller
            // ValueListenableBuilder<String>(
            //   valueListenable: mqttService.relayNotifier,
            //   builder: (context, value, child) {
            //     extractDimmersValue(value);
            //     // return SleekCircularSlider(
            //     //   min: 0,
            //     //   max: 100,
            //     //   initialValue: dimmer,
            //     //   innerWidget: (val) {
            //     //     int value = val.toInt();
            //     //     return Center(
            //     //       child: Container(
            //     //         // color: Colors.pink,
            //     //         child: Row(
            //     //           mainAxisAlignment: MainAxisAlignment.center,
            //     //           children: [
            //     //             InkWell(
            //     //               child: Icon(Icons.chevron_left_rounded),
            //     //               onTap: () async {
            //     //                 String msg =
            //     //                     await publishDimmerValueDecrearse();
            //     //                 mqttService.publish(
            //     //                     '${mqttService.id}relay/get', msg);
            //     //               },
            //     //             ),
            //     //             SizedBox(
            //     //               width: 25,
            //     //             ),
            //     //             Text(
            //     //               "$value \nTemp",
            //     //               style: CustomTextStyles.homeTitleLarge2DMSans,
            //     //               textAlign: TextAlign.center,
            //     //             ),
            //     //             SizedBox(
            //     //               width: 25,
            //     //             ),
            //     //             InkWell(
            //     //               child: Icon(Icons.chevron_right_rounded),
            //     //               onTap: () async {
            //     //                 String msg = await publishDimmerValueIncrease();
            //     //                 mqttService.publish(
            //     //                     '${mqttService.id}relay/get', msg);
            //     //               },
            //     //             ),
            //     //           ],
            //     //         ),
            //     //       ),
            //     //     );
            //     //   },
            //     //   appearance: CircularSliderAppearance(
            //     //       size: screenHeight * 30,
            //     //       customWidths: CustomSliderWidths(
            //     //           progressBarWidth: 20, shadowWidth: 10),
            //     //       customColors: CustomSliderColors(
            //     //           trackColor:
            //     //               PrimaryColors().orangeNormal.withOpacity(0.5),
            //     //           //progressBarColor: PrimaryColors().orangeNormal,
            //     //           progressBarColors: [
            //     //             Colors.purple,
            //     //             PrimaryColors().orangeNormal,
            //     //             Colors.red,
            //     //           ],
            //     //           shadowColor: PrimaryColors().orangeNormal)),
            //     // );
            //     return Text(value);
            //   },
            // ),

            // Text("${msgMqttResponse}"),
            SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: dimmer,
              innerWidget: (val) {
                int value = val.toInt();
                return Center(
                  child: Container(
                    // color: Colors.pink,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Icon(Icons.chevron_left_rounded),
                          onTap: () async {
                            String msg = await publishDimmerValueDecrearse();
                            mqttService.publish(
                                '${mqttService.id}relay/get', msg);
                          },
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Text(
                          "$value \nTemp",
                          style: CustomTextStyles.homeTitleLarge2DMSans,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        InkWell(
                          child: Icon(Icons.chevron_right_rounded),
                          onTap: () async {
                            String msg = await publishDimmerValueIncrease();
                            mqttService.publish(
                                '${mqttService.id}relay/get', msg);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              appearance: CircularSliderAppearance(
                size: screenHeight * 30,
                customWidths:
                    CustomSliderWidths(progressBarWidth: 20, shadowWidth: 10),
                customColors: CustomSliderColors(
                    trackColor: PrimaryColors().orangeNormal.withOpacity(0.5),
                    //progressBarColor: PrimaryColors().orangeNormal,
                    progressBarColors: [
                      Colors.purple,
                      PrimaryColors().orangeNormal,
                      Colors.red,
                    ],
                    shadowColor: PrimaryColors().orangeNormal),
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
                    SmallButtons(Icons.wind_power, "Cold", true),
                    SmallButtons(Icons.wind_power, "Cold", false),
                    SmallButtons(Icons.wind_power, "Cold", false),
                    SmallButtons(Icons.wind_power, "Cold", false),
                    SmallButtons(Icons.wind_power, "Cold", false),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            DeviceDivider(
              size: 5,
            ),
            SizedBox(
              height: screenHeight * 1,
            ),

            ///Scene heading
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 4, right: screenWidth * 4),
              child: DeviceSceneTitle(
                title: 'Scenes',
                toShowCount: true,
                count: '10',
              ),
            ),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///Scene container
            SceneContainer(scenes: [
              SceneCompo(
                  title: "Morning coffee",
                  data: "Everyday | 08:15 AM - 9:00 AM"),
              DeviceDivider(
                size: 2,
              ),
              SceneCompo(
                  title: "Morning coffee",
                  data: "Everyday | 08:15 AM - 9:00 AM"),
              DeviceDivider(
                size: 2,
              ),
              SceneCompo(
                  title: "Morning coffee",
                  data: "Everyday | 08:15 AM - 9:00 AM"),
            ]),
            SizedBox(
              height: screenHeight * 2,
            ),
          ],
        ),
      ),
    );
  }

  Future<double> extractDimmersValue(String message) async {
    try {
      final decodedMessage = json.decode(message);
      final dimmerValue = decodedMessage['Switch']['Dimmers'][0];
      print("Extracted Dimmer Value: $dimmerValue");
      pubDimmerValue = dimmerValue;
      await SharedPreferencesHelper.saveDimmers(pubDimmerValue);
      int? dimmerStored = await SharedPreferencesHelper.getDimmers();
      return dimmerStored!.toDouble();
    } catch (e) {
      print("Error extracting dimmer value: $e"); // Debug print
      return 0.0;
    }
  }

  Future<String> publishDimmerValueDecrearse() async {
    int? storedDimmerValue = await SharedPreferencesHelper.getDimmers();
    int pubDimmerValue = storedDimmerValue ?? 100;
    List<int> storedRelays = await SharedPreferencesHelper.getRelays();
    if (pubDimmerValue <= 100 && pubDimmerValue >= 20) {
      pubDimmerValue -= 20;
      dimmer = pubDimmerValue.toDouble();
      await SharedPreferencesHelper.saveDimmers(pubDimmerValue);
      setState(() {

      });
    }
    return '{"Switch":{"Relays":$storedRelays,"Dimmers":[$pubDimmerValue]}}';
  }

  Future<String> publishDimmerValueIncrease() async {
    int? storedDimmerValue = await SharedPreferencesHelper.getDimmers();
    int pubDimmerValue = storedDimmerValue ?? 100;
    List<int> storedRelays = await SharedPreferencesHelper.getRelays();
    if (pubDimmerValue <= 80 && pubDimmerValue >= 0) {
      pubDimmerValue += 20;
      await SharedPreferencesHelper.saveDimmers(pubDimmerValue);
      dimmer = pubDimmerValue.toDouble();
      setState(() {

      });
    }
    return '{"Switch":{"Relays":$storedRelays,"Dimmers":[$pubDimmerValue]}}';
  }
}
