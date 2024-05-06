import 'dart:math';

import 'package:iot_application1/core/app_export.dart';
import 'package:flutter/material.dart';


class GlassMorpObj extends StatelessWidget {
  //const GlassMorpObj({super.key});

  GlassMorpObj({
    Key? key,
    required this.t,
    required this.b,
    required this.l,
    required this.r,
    this.alignment,
    this.sH,
    this.sW
  }) : super(key : key);
  final double t;
  final double b;
  final double l;
  final double r;
  Alignment? alignment;
  double? sH;
  double? sW;
  @override
  Widget build(BuildContext context) {
    AutoHeight au = AutoHeight(context);
    return Padding(
      padding:EdgeInsets.only(top: screenHeight * t,left: screenWidth * l,right: screenWidth * r,bottom: screenHeight * b),
      child:Align(
        alignment:alignment ?? Alignment.topLeft,
        child: Container(
          width: sW ?? screenWidth * 35,
          height:sH ?? screenHeight * 20,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: PrimaryColors().orangeNormal.withOpacity(0.9)
          ),
        ),
      ),
    );
  }
}

class CircleBlurPainter extends CustomPainter {

  CircleBlurPainter({required this.circleWidth, required this.blurSigma});

  double circleWidth;
  double blurSigma;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = Colors.lightBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = circleWidth
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}