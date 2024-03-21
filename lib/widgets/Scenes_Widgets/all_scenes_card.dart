import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../Popups/Delete Popup/delete_popup.dart';

class AllScenesCard extends StatelessWidget {

  AllScenesCard({Key? key,required this.title,required this.subTitle}) : super (key: key);

  final String title;
  final String subTitle;
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return  Padding(
      padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
      child: Slidable(
        key: const ValueKey(0),
        endActionPane: ActionPane(
          motion: ScrollMotion(),
          children: [
            SlidableAction(
              // An action can be bigger than the others.
              flex: 1,
              onPressed: (context){
                Get.toNamed(AppRoutes.editScene);
              },
              backgroundColor: PrimaryColors().orangeNormal,
              foregroundColor: PrimaryColors().pureWhite,
              icon: Icons.edit,
              label: 'Edit',
            ),
            SlidableAction(
              flex: 1,
              onPressed: (context){
                print("Delete");
                ///Same Like all rooms page
                ///If you have any doubt please refer the all the rooms page for a clear understanding
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return DeletePopup(title: "Delete Scene",subtitle: "Are you sure you want to Delete?",function: (){},);
                    }
                );
              },
              backgroundColor: Colors.red,
              foregroundColor: PrimaryColors().pureWhite,
              icon: Icons.delete_outline,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          height: screenHeight * 12,
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
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: screenWidth * 70,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
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
          ),
        ),
      ),
    );
  }
}
