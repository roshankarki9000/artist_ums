import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConstants {
  SizeConstants._();

  static const double screenHeight = 932;
  static const double screenWidth = 430;

  static EdgeInsets get hPaddingEdge =>
      EdgeInsets.symmetric(horizontal: hPadding);

  static EdgeInsets get scaffoldPaddingEdge => EdgeInsets.only(
    left: hPadding,
    right: hPadding,
    top: vPadding,
    bottom: 14.h,
  );

  static double get hPadding => 20.w;

  static double get vPadding => 24.h;

  static SizedBox get bottomSizeBox => SizedBox(height: bottomGap);

  static SizedBox get vGap24 => SizedBox(height: 24.h);
  static SizedBox get vGap16 => SizedBox(height: 16.h);

  static double get bottomGap => 15.h;
  static const Size screenSize = Size(screenWidth, screenHeight);

  static double get textFieldGapHeight => 23.h;
  static SizedBox get textFieldGap => SizedBox(height: textFieldGapHeight);

  static EdgeInsets get edgeForTap =>
      EdgeInsets.only(left: hPadding, right: paddingForTap);

  static double get paddingForTap => 3.w;
}
