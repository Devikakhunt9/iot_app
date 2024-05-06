import 'dart:ui';

import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';

class GlassMorphBg extends StatelessWidget {
  //const GlassMorphBg({super.key});

  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
      child: Container(
        height: screenHeight * 100,
        width: double.maxFinite,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
              Theme.of(context).colorScheme.secondaryContainer.withOpacity(0.2),
            ],
            begin: AlignmentDirectional.topStart,
            end: AlignmentDirectional.bottomEnd,
          ),
          // color: Colors.red,
        ),
      ),
    );
  }
}
