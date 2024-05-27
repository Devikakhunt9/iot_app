import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class TopBar extends StatelessWidget {
  const TopBar( this.roomName, this.devices, this.image);
  final String roomName,  devices,  image;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 15,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(15),
        border: GradientBoxBorder(
          gradient: LinearGradient(colors: [
            appTheme.black900,
            appTheme.orange900,
          ]),
          width: 2,
        ),
      ),
      child: Stack(
        children: [
          ///Outline circle
          Positioned(
              bottom: -28,
              //left: -20,
              right: -23,
              child: Container(
                  width: 185,
                  height: 189,
                  decoration: BoxDecoration(
                    color: PrimaryColors().gray800,
                    borderRadius: BorderRadius.circular(100),
                  ))),

          ///Image Container
          Positioned(
              bottom: -16,
              //left: -20,
              right: -15,
              child: Container(
                width: 165,
                height: 164,
                decoration: BoxDecoration(
                  //color: Theme.of(context).colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      image,
                      fit: BoxFit.fill,
                    )),
              )),

          ///Text
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 15, bottom: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomName,
                    style: CustomTextStyles.homeTitleLarge2DMSans,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    devices,
                    style: CustomTextStyles.homeTitleLargeDMSans,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}