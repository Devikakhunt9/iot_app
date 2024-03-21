import 'dart:ui';

import 'package:aagash_s_application1/core/app_export.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'dart:math' as math;


class GlassMorphism extends StatelessWidget {
  final Widget child;
  final double start;
  final double end;
  const GlassMorphism({
    Key? key,
    required this.child,
    required this.start,
    required this.end,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 0,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.surfaceTint.withOpacity(start),
                  Theme.of(context).colorScheme.surfaceTint.withOpacity(start),
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.bottomEnd,
              ),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              border:  GradientBoxBorder(
                gradient: LinearGradient(colors: [appTheme.black900,
                  appTheme.orange900,]),
                width: 2,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

