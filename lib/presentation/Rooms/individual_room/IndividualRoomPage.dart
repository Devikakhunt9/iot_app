import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/core/mqtt/mqtt_service.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/temp_card.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/title_widget.dart';
import 'package:iot_application1/presentation/Rooms/individual_room/top_bar.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_device_card.dart';
import '../../Homepage/HomePage/controller/homeController.dart';

class IndividualRoomPage extends StatefulWidget {
  IndividualRoomPage({Key? key}) : super(key: key);

  @override
  State<IndividualRoomPage> createState() => _IndividualRoomPageState();
}

class _IndividualRoomPageState extends State<IndividualRoomPage> {
  final controller = Get.put<HomeController>(HomeController());
  MqttService mqttService = new MqttService();

  @override
  void initState() {
    super.initState();
    // _mqttHandler.connect();

    mqttService.connect();
  }

  @override
  void dispose() {
    mqttService.disconnect();
    super.dispose();
  }

  // List<CustomDeviceCard> devices = [
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
              child:
                  TopBar("Living Room", "4 devices", "assets/images/home.jpeg"),
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
            ValueListenableBuilder<String>(
              valueListenable: mqttService.relayNotifier,
              builder: (context, value, child) {
                // setState(() {
                //
                // });
                // print(value);
                return Text(value);
              },
            ),
            SizedBox(
              height: screenHeight * 2,
            ),
            GetBuilder<HomeController>(builder: (controller) {
              return GridView.count(
                shrinkWrap: true,
                primary: false,
                crossAxisCount: 2,
                mainAxisSpacing: screenHeight * 2,
                padding: EdgeInsets.only(
                    left: screenWidth * 2, right: screenWidth * 2),
                children: List.generate(controller.devices.length, (index) {
                  return Center(
                    child: CustomDeviceCard(
                      deviceName: controller.devices[index]["deviceName"],
                      roomName: controller.devices[index]["roomName"],
                      switchStatus: controller.devices[index]["switchStatus"],
                      onChanged: (bool) {
                        controller.changeSwtich(index);
                        mqttService.publish('${mqttService.id}relay/set',
                            '{"switch":{"relays":[0,0,0,0,0],"dimmers":[0]}}');
                        print("message published");
                      },
                    ),
                  );
                }),
              );
            }),

            ///Grid View
            // GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 2,
            //   mainAxisSpacing: screenHeight * 2,
            //   padding: EdgeInsets.only(
            //       left: screenWidth * 2, right: screenWidth * 2),
            //   children: List.generate(4, (index) {
            //     return Center(child: devices[index]);
            //   }),
            // ),
            SizedBox(
              height: screenHeight * 5,
            )
          ],
        ),
      ),
    );
  }
}
