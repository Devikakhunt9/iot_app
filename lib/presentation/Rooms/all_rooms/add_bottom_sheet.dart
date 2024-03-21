import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/presentation/Rooms/all_rooms/controller/all_rooms_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/size_utils.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_floating_text_field.dart';

class AddRoomBottomSheet extends StatelessWidget {
  AllRoomsController controller = AllRoomsController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return SizedBox(
      height: screenHeight * 28,
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            ///Top gray Container
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                ),
              ),
            ),

            ///  Room name title
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 4,
                  right: screenWidth * 3,
                  top: screenHeight * 2),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Enter the room name:",
                    style: CustomTextStyles.homeTitleLargeDMSans,
                  )),
            ),
            SizedBox(
              height: screenHeight * 1,
            ),

            ///Room text field
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 3,
                  right: screenWidth * 3,
                  top: screenHeight * 1),
              child: CustomFloatingTextField(
                  context: context,
                  controller: controller.roomNameController,
                  labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                  labelText: "Enter room name",
                  // hintText:
                  //     "lbl_password".tr,
                  textInputAction: TextInputAction.done,
                  // textInputType:
                  // TextInputType
                  //     .emailAddress,
                  validator: (value) {
                    if (value == null) {
                      return "Please Enter the room name".tr;
                    }
                    return null;
                  }),
            ),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///Button
            GestureDetector(
              onTap: () {
                print("Hello");
              },
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 3,
                    right: screenWidth * 3,
                    top: screenHeight * 1),
                child: SizedBox(
                  width: double.maxFinite,
                  height: screenHeight * 5,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your action here
                      print('Button Pressed');
                      if (_formKey.currentState!.validate()) {
                        print("New Room added successfully");

                        ///Add room logic needs to be added here
                        Navigator.pop(context);
                      }
                    },
                    child: Text(
                      'Add Room',
                      style: theme.textTheme.titleSmall,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}