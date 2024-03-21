import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';


class DeviceLabel extends StatelessWidget {
  //const DeviceLabel({super.key});
  DeviceLabel({required this.heading , required this.lastWidget});
  final String heading;
  final Widget lastWidget;
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return  Padding(
      padding: EdgeInsets.only(left: screenWidth * 4,right: screenWidth * 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ///Title Here
          Text(heading,style: CustomTextStyles.homeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,),
          ///Final widget here
          lastWidget
        ],
      ),
    );
  }
}

class DeviceDivider extends StatelessWidget {
  //const DeviceDivider({super.key});
  DeviceDivider({required this.size});
  final double size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(left: screenWidth * size,right: screenWidth * size),
      child: Divider(
        color: Colors.grey,
      ),
    );
  }
}

class DeviceSceneTitle extends StatelessWidget {
  //const DeviceSceneTitle({super.key});
  DeviceSceneTitle({required this.title,required this.toShowCount,required this.count});
  final String title;
  final bool toShowCount;
  final String count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            padding: EdgeInsets.only(top:6),
            height: screenHeight * 5.5,
            width: screenWidth * 70,
            child: Row(
              children: [
                Text(title.tr,style: CustomTextStyles.homeTitleLargeDMSans,maxLines: 1,overflow: TextOverflow.ellipsis,),
                SizedBox(
                  width: screenWidth * 2,
                ),
                Visibility(
                  visible: toShowCount,
                  child: Container(
                    height: screenHeight * 4,
                    width: screenWidth * 8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.orange,
                    ),
                    child: Center(child: Text(count,style: CustomTextStyles.titleSmallDMSansCount,)),
                  ),
                )
              ],
            )
        ),
        SizedBox(
          height: screenHeight * 2,
        ),
        Text(
        "See all",
        style: CustomTextStyles.titleSmallDMSansBluegray90001,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}

