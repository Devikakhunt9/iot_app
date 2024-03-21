import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_floating_text_field.dart';
import '../../widgets/custom_glassmorph.dart';

class AccountInformation extends StatelessWidget {

  //const AccountInformation({super.key});

  GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    late Map<String,dynamic> arguments = Get.arguments ?? {"showBackButton":false};
    bool toShowBackButton = arguments["showBackButton"];
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: toShowBackButton,
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth * 4),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Text("Account Information",style: CustomTextStyles.homeTitleLarge2DMSans,),
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
            Stack(
              children: [
                Center(
                  child: CircleAvatar(
                      radius: screenHeight * 13,
                      backgroundColor: Theme.of(context).colorScheme.surfaceTint,
                      child: CircleAvatar(
                        radius: screenHeight * 12.5,
                        backgroundImage: NetworkImage('https://via.placeholder.com/300'),
                      )
                  ),
                ),
                Positioned(
                    bottom: screenHeight * 1,
                    left: screenWidth * 45,
                    child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
                        child:
                        Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Icon(Icons.camera_alt,size: 25,color: PrimaryColors().orangeNormal,),
                        ))
                )
              ],
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
                        height: screenHeight*47,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: screenHeight*3 ,
                            ),
                            ///Name box
                            Text(
                              "lbl_accInfo_name".tr,
                              style: CustomTextStyles.createHomeTitleLargeDMSans,
                            ),

                            SizedBox(
                              height: screenHeight*2,
                            ),
                            ///Name Text Field
                            CustomFloatingTextField(
                              context: context,
                              //controller: controller.deviceNameController,
                              labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                              labelText: "lbl_accInfo_name".tr,
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
                            ///Phone number
                            Text(
                              "lbl_accInfo_phone".tr,
                              style: CustomTextStyles.createHomeTitleLargeDMSans,
                            ),
                            SizedBox(
                              height: screenHeight*2,
                            ),
                            ///Phone number text box
                            CustomFloatingTextField(
                              context: context,
                              //controller: controller.deviceNameController,
                              labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                              labelText: "lbl_accInfo_phone".tr,
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
                            ///email
                            Text(
                              "lbl_accInfo_email".tr,
                              style: CustomTextStyles.createHomeTitleLargeDMSans,
                            ),
                            SizedBox(
                              height: screenHeight*2,
                            ),
                            ///Email Text box
                            CustomFloatingTextField(
                              context: context,
                              //controller: controller.deviceNameController,
                              labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                              labelText: "lbl_accInfo_email".tr,
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
                text:"Done",
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
