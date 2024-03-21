import 'package:flutter/cupertino.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';

class SceneCompo extends StatelessWidget {
  //const SceneCompo({super.key});
  SceneCompo({required this.title,required this.data});
  final String title;
  final String data;
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Container(
      height: screenHeight * 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: screenWidth * 50,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      title,
                      style: CustomTextStyles.createHomeTitleLargeDMSans,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
              Container(
                width: screenWidth * 50,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    data,
                    style: CustomTextStyles.titleSmallDMSansBluegray90001,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              )
            ],
          ),
          CupertinoSwitch(
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
        ],
      ),
    );
  }
}
