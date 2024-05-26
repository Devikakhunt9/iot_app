import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class IndTitleWidget extends StatelessWidget {
  const IndTitleWidget(this.title,this.count,this.showCount);
  final String title,  count;
 final bool showCount;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 3,
        right: screenWidth * 3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.only(top: 6),
              height: screenHeight * 5.5,
            
              child: Row(
                children: [
                  Text(
                    title.tr,
                    style: CustomTextStyles.homeTitleLargeDMSans,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    width: screenWidth * 2,
                  ),
                  Visibility(
                    visible: showCount,
                    child: Container(
                      height: screenHeight * 4,
                      width: screenWidth * 8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.orange,
                      ),
                      child: Center(
                          child: Text(
                            count,
                            style: CustomTextStyles.titleSmallDMSansCount,
                          )),
                    ),
                  )
                ],
              )),
          SizedBox(
            height: screenHeight * 2,
          ),
         GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.linkDevice);
                  },
                  child: Padding(
                    padding: EdgeInsets.only(right: screenWidth * 2),
                    child: Row(
                      children: [
                        Icon(Icons.add),
                          Text("  Add Device",style: CustomTextStyles.titleSmallDMSansOnError,),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );

  }
}