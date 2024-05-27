import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:iot_application1/presentation/Rooms/all_rooms/add_bottom_sheet.dart';


class TitleWidget extends StatelessWidget {
  const TitleWidget(this.title,this.showCount,this.count);
  final String title;
  final String count;
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
              width: screenWidth * 70,
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
          ),GestureDetector(
            onTap: () {
              ///For adding new room
              ///Pass the controller to the room name controller
              ///call the api and update the list view do that new room get added to the list
              showModalBottomSheet(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return AddRoomBottomSheet();
                  });
            },
            child: Padding(
              padding: EdgeInsets.only(right: screenWidth * 3),
              child: Icon(Icons.add),
            ),
          )
          //FaIcon(FontAwesomeIcons.ellipsis,size: screenHeight * 2.5,color: Theme.of(context).colorScheme.onInverseSurface,),
        ],
      ),
    );
  }
}