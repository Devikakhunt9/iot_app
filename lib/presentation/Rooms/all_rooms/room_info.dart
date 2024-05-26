import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../core/utils/size_utils.dart';
import '../../../routes/app_routes.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/Popups/Delete Popup/delete_popup.dart';
import '../../../widgets/Popups/Edit Popup/edit_popup.dart';

class RoomInfo extends StatelessWidget {
  const RoomInfo(this.roomName, this.totalDevice,
      this.onDevice, this.offDevice, this.image);
  final String roomName,  totalDevice,
   onDevice,  offDevice,  image;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: screenWidth * 3, right: screenWidth * 3),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.individualRoom);
        },
        child: Slidable(
          key: const ValueKey(0),
          endActionPane: ActionPane(
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                // An action can be bigger than the others.
                flex: 1,
                onPressed: (context){
                  ///For editing the room name
                  ///For this you need to pass previous room name to the controller
                  ///so that you can again re modify the room name with previous name
                  ///Call the api and handle the old and the new name
                  ///Its better create a void call back in the bottom sheet then pass the function from here
                  showModalBottomSheet(
                      backgroundColor:
                      Theme.of(context).colorScheme.background,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(15),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return EditPopup();
                      });
                },
                backgroundColor: PrimaryColors().orangeNormal,
                foregroundColor: PrimaryColors().pureWhite,
                icon: Icons.edit,
                label: 'Edit',
              ),
              SlidableAction(
                flex: 1,
                onPressed: (context){
                  ///Update the API by passing a call back function from here to delete that particular room
                  print("Delete Room");
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return DeletePopup(title: "Delete Room",subtitle: "Are you sure you want to Delete?",function: (){},);
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
            height: screenHeight * 14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).colorScheme.background,
              border: GradientBoxBorder(
                gradient: LinearGradient(colors: [
                  appTheme.orange900,
                  appTheme.orange900,
                ]),
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                    top: -0.5,
                    //left: -20,
                    right: -21,
                    child: Container(
                        width: 108,
                        height: 108,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondaryContainer,
                          borderRadius: BorderRadius.circular(100),
                        ))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ///Device count for separate rooms
                    Padding(
                      padding: EdgeInsets.only(left: screenWidth * 5),
                      child: Container(
                        width: screenWidth * 40,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  roomName,
                                  style: CustomTextStyles.homeTitleLargeDMSans,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            SizedBox(
                              height: screenHeight * 1,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "lbl_allRooms_total".tr,
                                  style: CustomTextStyles.homeTitleSmallDMSans,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "lbl_allRooms_on".tr,
                                  style: CustomTextStyles.homeTitleSmallDMSans,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "lbl_allRooms_off".tr,
                                  style: CustomTextStyles.homeTitleSmallDMSans,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  totalDevice,
                                  style: CustomTextStyles.homeTitleLargeDMSans,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  onDevice,
                                  style:
                                  CustomTextStyles.homeTitleLargeDMSansGreen,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  offDevice,
                                  style: CustomTextStyles.homeTitleLargeDMSansRed,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: screenHeight * 2,
                          bottom: screenHeight * 2,
                          right: screenWidth * 0.3),
                      child: Container(
                        width: screenWidth * 20,
                        child: Center(
                          child: Image.asset(image),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
