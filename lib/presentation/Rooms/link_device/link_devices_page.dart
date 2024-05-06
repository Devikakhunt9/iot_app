import 'package:iot_application1/core/app_export.dart';
import 'package:iot_application1/presentation/Rooms/link_device/controller/link_device_controller.dart';
import 'package:flutter/material.dart';

import '../../../widgets/custom_elevated_button.dart';
import '../../../widgets/custom_floating_text_field.dart';
import '../../../widgets/custom_glassmorph.dart';

class LinkDevicePage extends StatelessWidget {
  // const LinkDevicePage({super.key});

  GlobalKey _formKey =GlobalKey();

  LinkDeviceController controller = LinkDeviceController();

  String? selectedValue;
  final _dropdownFormKey = GlobalKey<FormState>();
  List<DropdownMenuItem<String>> get dropdownItems{
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Living Room",style: TextStyle(color: Colors.white),),value: "Living Room"),
      DropdownMenuItem(child: Text("Living Room",style: TextStyle(color: Colors.white),),value: "Living Room"),
      DropdownMenuItem(child: Text("Living Room",style: TextStyle(color: Colors.white),),value: "Living Room"),
      DropdownMenuItem(child: Text("Living Room",style: TextStyle(color: Colors.white),),value: "Living Room"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 5,
            ),
            ///Top app bar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 4),
                  child: GestureDetector(
                    child: Icon(Icons.arrow_back),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text("Link Device",style: CustomTextStyles.homeTitleLarge2DMSans,),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 3),
                  //child: Icon(Icons.add),
                  child: Container(),
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 3,),
            ///Circular avatar
            Center(
              child: CircleAvatar(
                radius: screenHeight * 17,
                backgroundColor: Theme.of(context).colorScheme.surfaceTint,
                child: CircleAvatar(
                  radius: screenHeight * 16.5,
                  backgroundImage: NetworkImage('https://via.placeholder.com/150'),
                )
              ),
            ),
            SizedBox(
              height: screenHeight * 3,),

            ///Device Box
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 5,right: screenWidth * 5),
              child: GlassMorphism(
                start: 0.3,
                end: 0.3,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: screenHeight*35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight*3 ,
                            ),
                            ///Name box
                            Text(
                              "lbl_link_device_device_name".tr,
                              style: CustomTextStyles.createHomeTitleLargeDMSans,
                            ),

                            SizedBox(
                              height: screenHeight*2,
                            ),
                            CustomFloatingTextField(
                              context: context,
                              controller: controller.deviceNameController,
                              labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                              labelText: "lbl_create_home_your_name".tr,
                              textInputType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.done,
                              validator: (value) {
                                if (value == null) {
                                  return "err_create_home".tr;
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: screenHeight*3.5,
                            ),
                            ///Device Location
                            Text(
                              "lbl_link_device_device_loc".tr,
                              style: CustomTextStyles.createHomeTitleLargeDMSans,
                            ),
                            SizedBox(
                              height: screenHeight*2,
                            ),
                            SizedBox(
                              height: screenHeight * 7,
                              child: DropdownButtonFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(color: Theme.of(context).colorScheme.surface, width: 1),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    filled: true,
                                    fillColor:  Theme.of(context).colorScheme.surface,
                                  ),
                                  dropdownColor:  Theme.of(context).colorScheme.surface,
                                  value:selectedValue,
                                  ///Validation logic
                                  //validator: (value) => value == null ? "Select a Room" : null,
                                  onChanged: (String? newValue) {
                                    // setState(() {
                                    //   selectedValue = newValue!;
                                    // });
                                    selectedValue = newValue??"No value";
                                  },
                                  items: dropdownItems
                              ),
                            ),
                            SizedBox(
                              height: screenHeight*1,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 4,
            ),
            ///Button
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 5,right: screenWidth * 5),
              child: CustomElevatedButton(
                text:"Continue",
                onPressed:(){
                  ///Validation Logic
                  Get.toNamed(AppRoutes.homepage);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
