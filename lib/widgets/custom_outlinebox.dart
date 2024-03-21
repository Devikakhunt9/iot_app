import 'dart:ui';

import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:outline_gradient_button/outline_gradient_button.dart';


class CustomOutlineBox extends StatelessWidget {
  CustomOutlineBox({
    Key? key,
    this.objects,
    required this.height,
    required this.width,
    required this.borderRadius
  }) : super (key : key);
  final Widget? objects;
  final double borderRadius;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ///Glassmorphic container
        // Container(
        //   height: height,
        //   width: width,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(borderRadius),
        //     gradient: LinearGradient(
        //       begin: Alignment.topLeft,
        //       end: Alignment.bottomRight,
        //       colors: [
        //         Colors.white.withOpacity(0.2),
        //         Colors.white.withOpacity(0.2),
        //       ],
        //     ),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.black.withOpacity(0.1),
        //         spreadRadius: 0,
        //         blurRadius: 2,
        //       ),
        //     ],
        //   ),
        //   child:ClipRRect(
        //     borderRadius: BorderRadius.circular(40.0),
        //     child: BackdropFilter(
        //       filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        //       child: Container(
        //         color: Colors.white.withOpacity(0.1),
        //       ),
        //     ),
        //   ),
        // ),
        OutlineGradientButton(
          ///Padding for outline gradient
            padding: EdgeInsets.only(
              left: 2.h,
              top: 2.v,
              right: 2.h,
              bottom: 2.v,
            ),
            strokeWidth: 3.h,
            gradient: LinearGradient(
              begin: Alignment(1, 0.01),
              end: Alignment(0.07, 1),
              colors: [
                appTheme.black900,
                appTheme.orange900,
              ],
            ),
            corners: Corners(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius),
            ),

            child: objects!
        ),
      ],
    );
  }
}
