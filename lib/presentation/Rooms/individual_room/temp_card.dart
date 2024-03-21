
import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';

class TempCard extends StatelessWidget {
  const TempCard(this.roomName,this.temp);
  final String roomName, temp;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: screenWidth * 4, right: screenWidth * 4),
        child: Container(
          height: screenHeight * 10,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ///Icon 1
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Icon(
                  Icons.ac_unit,
                  size: screenHeight * 4,
                ),
              ),

              ///Next Container
              Container(
                height: screenHeight * 10,
                width: screenWidth * 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: PrimaryColors().gray300.withOpacity(0.5),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Icon 2
                    Padding(
                      padding: EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.bubble_chart),
                    ),

                    ///Text
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                          width: screenWidth * 40,
                          child: Text(
                            "Current temperature in $roomName",
                            style: CustomTextStyles.homeNavBarTextDMSans,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )),
                    ),

                    ///Temp count
                    Padding(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Text(
                        temp,
                        style: CustomTextStyles.homeTitleLarge2DMSans,
                      ),
                    )

                    ///Title
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
