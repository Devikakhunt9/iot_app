import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../theme/custom_text_style.dart';

class OrDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth*2,
        //top :1.h,
        right: screenWidth*2,
        //bottom: 10.h
      ),
      child: Row(
        mainAxisAlignment:
        MainAxisAlignment.center,
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Text(
                  "lbl_or".tr,
                  style: CustomTextStyles.titleSmallDMSansBluegray900
              ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     top: 7.v,
          //     bottom: 10.v,
          //   ),
          //   child: SizedBox(
          //     width: 115.h,
          //     child: Divider(),
          //   ),
          // ),
          // Padding(
          //   padding:
          //   EdgeInsets.fromLTRB(12.h, 0, 0, 0),
          //   child: Text(
          //       "lbl_or".tr,
          //       style: CustomTextStyles.titleSmallDMSansBluegray900
          //   ),
          // ),
          // Padding(
          //   padding: EdgeInsets.only(
          //     top: 7.v,
          //     bottom: 10.v,
          //   ),
          //   child: SizedBox(
          //     width: 127.h,
          //     child: Divider(
          //       indent: 12.h,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
