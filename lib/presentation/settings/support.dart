import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_floating_text_field.dart';

class Support extends StatelessWidget {
  //const Support({super.key});

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Scaffold(
        backgroundColor:  Theme.of(context).colorScheme.background,
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
                    padding: EdgeInsets.only(left: screenWidth * 3),
                    child: GestureDetector(
                      child: Icon(Icons.arrow_back),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Text(
                    "Support",
                    style: CustomTextStyles.homeTitleLarge2DMSans,
                  ),
                  Container()
                ],
              ),
              
              ///Support Content
              SizedBox(
                height: screenHeight * 3,
              ),
              ///Icon or image here
              CircleAvatar(
                radius: 80,
                child: Center(child: Icon(Icons.support_agent,size: screenHeight * 13,),),
              ),
              SizedBox(
                height: screenHeight * 3,
              ),
              ///Text
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 3,right: screenWidth * 3),
                child: SizedBox(
                  child: Form(
                    child: Column(
                      children: [
                        Text("Please provide your reasons bellow so that our team will help you to resolve your issue!",style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,),
                        SizedBox(
                          height: screenHeight * 2,
                        ),
                        SizedBox(
                          child: CustomFloatingTextField(
                              context: context,
                              // controller: controller
                              //     .emailController,
                              labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                              labelText: "Reason".tr,
                              // hintText:
                              //     "lbl_password".tr,
                              textInputAction:
                              TextInputAction
                                  .done,
                              // textInputType:
                              // TextInputType
                              //     .emailAddress,
                              ///Email validation here
                              validator: (value) {
                                if (value == null) {
                                  return "Please provide a reason"
                                      .tr;
                                }

                                return null;
                              }
                              ),
                        ),
                        SizedBox(
                          height: screenHeight * 5,
                        ),
                        Text("Please provide additional comments bellow so that our team will help you to resolve your issue!",style: CustomTextStyles.homeTitleLargeDMSans,overflow: TextOverflow.fade,),
                        SizedBox(
                          height: screenHeight * 2,
                        ),
                        CustomFloatingTextField(
                            context: context,
                            textAlignVert:  TextAlignVertical.top,
                            contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 10 ,horizontal: screenWidth * 2),

                            // controller: controller
                            //     .emailController,
                            labelStyle: CustomTextStyles.labelLargeDMSansWhiteA700,
                            //labelText: "Additional Comments".tr,
                            // hintText:
                            //     "lbl_password".tr,
                            textInputAction:
                            TextInputAction
                                .done,
                            // textInputType:
                            // TextInputType
                            //     .emailAddress,
                            ///Email validation here
                            validator: (value) {
                              if (value == null) {
                                return "Please provide Additional Comments for better clarification!"
                                    .tr;
                              }
                              return null;
                            }
                        ),
                        SizedBox(
                          height: screenHeight * 2,
                        ),
                        GestureDetector(
                          onTap: (){
                                ///Validation logic here bellow
                          },
                          child: Container(
                            height: screenHeight * 7,
                            width: double.maxFinite,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                             color: PrimaryColors().orangeNormal,
                            ),
                            child: Center(child: Text("Contact support",style: theme.textTheme.titleSmall,),),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
    );
  }
}
