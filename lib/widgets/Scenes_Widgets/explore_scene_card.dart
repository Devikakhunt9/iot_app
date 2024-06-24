import 'package:google_fonts/google_fonts.dart';
import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class ExploreSceneCard extends StatelessWidget {
  ExploreSceneCard({
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
      padding: EdgeInsets.only(
          left: screenWidth * 3, right: screenWidth * 3, bottom: 2),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.allScenes);
        },
        child: Container(
          padding: EdgeInsets.only(bottom: 4, top: 4),
          width: double.maxFinite,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondaryContainer,
            border: GradientBoxBorder(
              gradient: LinearGradient(colors: [
                appTheme.black900,
                appTheme.orange900,
              ]),
              width: .8,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        title,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      )),
                  SizedBox(
                    height: 3,
                  ),
                  Wrap(
                    children: [
                      Text(
                        subTitle,
                        style: CustomTextStyles.homeTitleSmallDMSans,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
