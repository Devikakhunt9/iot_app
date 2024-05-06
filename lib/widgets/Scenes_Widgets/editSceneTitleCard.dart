import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';


class EditSceneTitleCard extends StatelessWidget {

  EditSceneTitleCard({
    Key? key,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Padding(
      padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
      child: Container(
        height: screenHeight * 11,
        width: double.maxFinite,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).colorScheme.secondaryContainer,
          border: GradientBoxBorder(
            gradient: LinearGradient(colors: [
              appTheme.black900,
              appTheme.orange900,
            ]),
            width: 2,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    title,
                    style: CustomTextStyles.homeTitleLarge2DMSans,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
              Wrap(
                children: [
                  Text(
                    subTitle,
                    style: CustomTextStyles.homeTitleSmallDMSans,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}