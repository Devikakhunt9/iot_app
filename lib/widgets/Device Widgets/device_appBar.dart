import 'package:aagash_s_application1/core/app_export.dart';
import 'package:aagash_s_application1/widgets/Popups/Permission%20Popup/permission_popup.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../core/utils/size_utils.dart';
import '../../theme/custom_text_style.dart';

class DeviceAppBar extends StatelessWidget {
  DeviceAppBar({required this.deviceName, required this.roomName});

  final String roomName;
  final String deviceName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ///Back Icon
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back,
                    size: screenHeight * 4,
                  )),
              SizedBox(
                width: screenWidth * 3,
              ),

              ///User name
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: screenWidth * 50,
                        child: Text(
                          deviceName,
                          style: CustomTextStyles.titleSmallDMSansBluegray90001,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                    Container(
                        width: screenWidth * 50,
                        child: Text(
                          roomName,
                          style: CustomTextStyles.createHomeTitleLargeDMSans,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ],
                ),
              ),
            ],
          ),
          ///Refer the bellow functionality to call the specific pop up from the particular device
          ///From this on pop up you can do turn on and turn off, just by passing the isTurnOn bool
          ///And you need to pass the API functionality in the ON TAP call back function
          GestureDetector(
            onTap: (){showDialog(
                context: context,
                builder: (BuildContext context){
                  return PermissionPopup(title: "Manage your device",content: "This is a dummy text please pass proper content form the API",isTurnOn:true,onTap: (){print("functionality here");});
                }
            );
            },
            child: FaIcon(
              FontAwesomeIcons.ellipsis,
              size: screenHeight * 2.5,
              color: Theme.of(context).colorScheme.onInverseSurface,
            ),
          ),
        ],
      ),
    );
  }
}
