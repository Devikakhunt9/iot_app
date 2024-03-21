import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class DeletePopup extends StatelessWidget {
  //const DeletePopup({super.key});

  DeletePopup({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.function,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(),
      contentPadding: EdgeInsets.only(
        bottom: screenHeight * 2,
        left: screenWidth * 4,
        right: screenWidth * 4,
      ),
      content: Container(
        height: screenHeight * 33,
        width: double.maxFinite,
        //color: Theme.of(context).colorScheme.background,
        child: Column(
          children: [
            ///Add your image here inside the circle avatar
            CircleAvatar(
              radius: 40,
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            Text(
              title,
              style: CustomTextStyles.homeTitleLargeDMSans,
            ),
            SizedBox(
              height: screenHeight * 1,
            ),
            Text(
              subtitle,
              style: CustomTextStyles.homeTitleSmallDMSans,
              maxLines: 2,
              overflow: TextOverflow.fade,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///delete Button - pass the function to the on tap parameter
            ///Crate a void call back variable and add it in the constructor so that on tap it will do the delete api functionality
            GestureDetector(
              ///Clear it to make it as call back function
              onTap: function,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.red,
                ),
                height: screenHeight * 5,
                child: Center(
                  child: Text(
                    "Delete",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 2,
            ),

            ///Cancel Button
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: PrimaryColors().gray500,
                ),
                height: screenHeight * 5,
                child: Center(
                  child: Text(
                    "Cancel",
                    style: theme.textTheme.titleSmall,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // actions: <Widget>[
      //   TextButton(
      //     onPressed: () {
      //       // Close the dialog
      //       Navigator.of(context).pop();
      //     },
      //     child: Text('OK'),
      //   ),
      // ],
    );
  }
}
