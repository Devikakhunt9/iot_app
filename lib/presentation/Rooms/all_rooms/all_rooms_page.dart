import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Rooms/all_rooms/add_bottom_sheet.dart';
import 'package:iot_application1/presentation/Rooms/all_rooms/controller/all_rooms_controller.dart';
import 'package:iot_application1/presentation/Rooms/all_rooms/room_info.dart';
import 'package:iot_application1/presentation/Rooms/all_rooms/title.dart';
import 'package:iot_application1/widgets/custom_floating_text_field.dart';
import 'package:flutter/material.dart';

class AllRoomsPage extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AllRoomsController controller = AllRoomsController();

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
       /// backgroundColor: Colors.white,
        centerTitle: false,
        titleSpacing: 12,
        title: Text(
          "Rooms",
          style: CustomTextStyles.homeTitleLarge2DMSans,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //   SizedBox(
            //     height: screenHeight * 6,
            //   ),

            //   ///Top app bar
            //   Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.only(left: screenWidth * 3),
            //         child: GestureDetector(
            //           child: Icon(Icons.arrow_back),
            //           onTap: () {
            //             Navigator.pop(context);
            //           },
            //         ),
            //       ),
            //       Text(
            //         "All Rooms",
            //         style: CustomTextStyles.homeTitleLarge2DMSans,
            //       ),
            //       GestureDetector(
            //         onTap: () {
            //           ///For adding new room
            //           ///Pass the controller to the room name controller
            //           ///call the api and update the list view do that new room get added to the list
            //           showModalBottomSheet(
            //               backgroundColor:
            //                   Theme.of(context).colorScheme.background,
            //               shape: const RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.vertical(
            //                   top: Radius.circular(15),
            //                 ),
            //               ),
            //               context: context,
            //               builder: (context) {
            //                 return AddRoomBottomSheet();
            //               });
            //         },
            //         child: Padding(
            //           padding: EdgeInsets.only(right: screenWidth * 3),
            //           child: Icon(Icons.add),
            //         ),
            //       )
            //     ],
            //   ),
            //   SizedBox(
            //     height: screenHeight * 4,
            //   ),

            ///Search bar
            // Padding(
            //   padding: EdgeInsets.only(
            //       top: 12, left: screenWidth * 3, right: screenWidth * 3),
            //   child: CustomFloatingTextField(
            //     context: context,
            //     labelText: "lbl_allRooms_search".tr,
            //     fillColor: Colors.white,
            //     borderDecoration: OutlineInputBorder(),
            //     suffix: Icon(
            //       Icons.search,
            //       color: PrimaryColors().black900,
            //     ),
            //   ),
            // ),
            // SizedBox(
            //   height: screenHeight * 2,
            // ),

            ///Title widgets
            Padding(
              padding: EdgeInsets.only(
                left: screenWidth * 3,
                right: screenWidth * 3,
                top: 20
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text(
                            "Add Room ",
                            style: CustomTextStyles.homeTitleLargeDMSans,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                
                  GestureDetector(
                    onTap: () {
                      ///For adding new room
                      ///Pass the controller to the room name controller
                      ///call the api and update the list view do that new room get added to the list
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
            ),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///List of Rooms available - as of dummy need to add a listview builder
            RoomInfo("Living Room", "10", "8", "1", "assets/images/sofa.png"),
            SizedBox(
              height: screenHeight * 2,
            ),
            RoomInfo("Kitchen", "10", "8", "1", "assets/images/sofa.png"),
            SizedBox(
              height: screenHeight * 2,
            ),
            RoomInfo("Bathroom", "10", "8", "1", "assets/images/sofa.png"),
          ],
        ),
      ),
    );
  }
}
