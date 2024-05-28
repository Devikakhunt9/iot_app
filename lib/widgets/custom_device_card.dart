import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'dart:math' as math;
import '../core/utils/size_utils.dart';
import '../theme/custom_text_style.dart';
import '../theme/theme_helper.dart';

class CustomDeviceCard extends StatelessWidget {
  CustomDeviceCard({
    Key? key,
    required this.deviceName,
    required this.roomName,
    required this.switchStatus,
  }) : super(key: key);

  final String deviceName;
  final String roomName;
  late bool switchStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Positioned(
              top: -4,
              left: -20,
              child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    //color: Color(0xff4E4E53),
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(100),
                  ))),
          Container(
            height: screenHeight * 25,
            width: screenWidth * 42.1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.transparent,
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  appTheme.black900,
                  appTheme.orange900,
                ]),
                width: 2,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(
                //   height: screenHeight * 2,
                // ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ///Image
                      Padding(
                        padding: EdgeInsets.only(left: 12),
                        child: Container(
                          height: 60,
                          width: 60,
                          color: Colors.transparent,
                          child: Image.asset("assets/images/device.png"),
                        ),
                      ),
                      Transform.rotate(
                        angle: 90 * math.pi / 180,
                        child: CupertinoSwitch(
                          //inactiveTrackColor: PrimaryColors().gray500,
                          offLabelColor: PrimaryColors().gray500,
                          activeColor: PrimaryColors().orangeNormal,
                          trackColor: PrimaryColors().gray500,
                          value: false,
                          onChanged: (value) {
                            print("Change");
                            switchStatus = !switchStatus;
                          },
                        ),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: screenHeight * 5,
                // ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              deviceName,
                              style:
                                  CustomTextStyles.createHomeTitleLargeDMSans,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),

                      ///RoomName
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              roomName,
                              style: CustomTextStyles.homeTitleSmallDMSans,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      SizedBox(
                        height: screenHeight * 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
