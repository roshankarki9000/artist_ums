//Note: Its getter because it uses screen utils, also because of dark mode support

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class StylesConstants {
  StylesConstants._();

  static TextStyle get white24w600 => _white(24.sp, FontWeight.w600);

  static TextStyle get white16w400 => _white(16.sp, FontWeight.w400);

  static TextStyle get white16w600 => _white(16.sp, FontWeight.w600);

  static TextStyle get white18w600 => _white(18.sp, FontWeight.w600);

  static TextStyle get white16w700 => _white(16.sp, FontWeight.w700);

  static TextStyle get white14w500 => _white(14.sp, FontWeight.w500);

  static TextStyle get white14w400 => _white(14.sp, FontWeight.w400);

  static TextStyle get white12w500 => _white(12.sp, FontWeight.w500);

  static TextStyle get white12w600 => _white(12.sp, FontWeight.w600);

  static TextStyle get white10w600 => _white(10.sp, FontWeight.w600);
  static TextStyle get white10w700 => _white(10.sp, FontWeight.w700);
  static TextStyle get white12w700 => _white(12.sp, FontWeight.w700);

  static TextStyle get fontWhite14w700 => _fontWhite(14.sp, FontWeight.w700);
  static TextStyle get fontWhite12w400 => _fontWhite(12.sp, FontWeight.w400);

  static TextStyle get fontWhite14w500 => _fontWhite(14.sp, FontWeight.w500);

  static TextStyle get fontWhite20w500 => _fontWhite(20.sp, FontWeight.w500);

  static TextStyle get textDark8w500 => _textDark(9.sp, FontWeight.w500);
  static TextStyle get textDark7w500 => _textDark(7.sp, FontWeight.w500);

  static TextStyle get textDark12w600 => _textDark(12.sp, FontWeight.w600);

  static TextStyle get textDark12w500 => _textDark(12.sp, FontWeight.w500);
  static TextStyle get textDark10w500 => _textDark(10.sp, FontWeight.w500);
  static TextStyle get textDark10w600 => _textDark(10.sp, FontWeight.w600);

  static TextStyle get textDark13w400 => _textDark(13.sp, FontWeight.w400);

  static TextStyle get textDark13w500 => _textDark(13.sp, FontWeight.w500);
  static TextStyle get textDark13w600 => _textDark(13.sp, FontWeight.w600);

  static TextStyle get textDark12w400 => _textDark(12.sp, FontWeight.w400);

  static TextStyle get textDark16w500 => _textDark(16.sp, FontWeight.w500);

  static TextStyle get textDark24w600 => _textDark(24.sp, FontWeight.w600);
  static TextStyle get textDark20w700 => _textDark(20.sp, FontWeight.w700);

  static TextStyle get textDark24w700 => _textDark(24.sp, FontWeight.w700);

  static TextStyle get textDark22w600 => _textDark(22.sp, FontWeight.w600);

  static TextStyle get textDark16w600 => _textDark(16.sp, FontWeight.w600);

  static TextStyle get textDark16w700 => _textDark(16.sp, FontWeight.w700);

  static TextStyle get textDark16w400 => _textDark(16.sp, FontWeight.w400);

  static TextStyle get textDark14w200 => _textDark(14.sp, FontWeight.w200);

  static TextStyle get textDark14w400 => _textDark(14.sp, FontWeight.w400);

  static TextStyle get textDark18w600 => _textDark(18.sp, FontWeight.w600);

  static TextStyle get textDark18w700 => _textDark(18.sp, FontWeight.w700);

  static TextStyle get textDark14w700 => _textDark(14.sp, FontWeight.w700);

  static TextStyle get textDark18w500 => _textDark(18.sp, FontWeight.w500);

  static TextStyle get textDark18w400 => _textDark(18.sp, FontWeight.w400);

  static TextStyle get textNormal14w400 => _textNormal(14.sp, FontWeight.w400);

  static TextStyle get textNormal14w500 => _textNormal(14.sp, FontWeight.w500);

  static TextStyle get textNormal14w600 => _textNormal(14.sp, FontWeight.w600);

  static TextStyle get textNormal13w400 => _textNormal(13.sp, FontWeight.w400);

  static TextStyle get textNormal12w400 => _textNormal(12.sp, FontWeight.w400);
  static TextStyle get textNormal10w400 => _textNormal(10.sp, FontWeight.w400);
  static TextStyle get textNormal8w400 => _textNormal(8.sp, FontWeight.w400);

  static TextStyle get textNormal12w500 => _textNormal(12.sp, FontWeight.w500);

  static TextStyle get textNormal12w600 => _textNormal(12.sp, FontWeight.w600);

  static TextStyle get textNormal14w300 => _textNormal(14.sp, FontWeight.w300);

  static TextStyle get textDark14w600 => _textDark(14.sp, FontWeight.w600);

  static TextStyle get textDark14w500 => _textDark(14.sp, FontWeight.w500);

  static TextStyle get textDark20w500 => _textDark(20.sp, FontWeight.w500);

  static TextStyle get textDark20w600 => _textDark(20.sp, FontWeight.w600);

  static TextStyle get textDark29w600 => _textDark(29.sp, FontWeight.w600);

  static TextStyle get textLight14w400 => _textLight(14.sp, FontWeight.w400);

  static TextStyle get textLight14w500 => _textLight(14.sp, FontWeight.w500);
  static TextStyle get textLight14w600 => _textLight(14.sp, FontWeight.w600);
  static TextStyle get textLight16w400 => _textLight(16.sp, FontWeight.w400);
  static TextStyle get textLight16w500 => _textLight(16.sp, FontWeight.w500);
  static TextStyle get textLight16w600 => _textLight(16.sp, FontWeight.w600);

  static TextStyle get textLight12w500 => _textLight(12.sp, FontWeight.w500);

  static TextStyle get textLight12w400 => _textLight(12.sp, FontWeight.w400);

  static TextStyle get textPrimary12w600 =>
      _textPrimary(12.sp, FontWeight.w600);

  static TextStyle get textPrimary14w500 =>
      _textPrimary(14.sp, FontWeight.w500);

  static TextStyle get fontRed12w400 => _fontRed(12.sp, FontWeight.w400);

  static TextStyle get fontRed12w500 => _fontRed(12.sp, FontWeight.w500);

  static TextStyle get fontRed16w600 => _fontRed(16.sp, FontWeight.w600);

  static TextStyle get fontRed14w500 => _fontRed(14.sp, FontWeight.w500);

  static TextStyle get primary10w600 => _fontPrimary(10.sp, FontWeight.w600);
  static TextStyle get primary12w600 => _fontPrimary(12.sp, FontWeight.w600);
  static TextStyle get primary22w700 => _fontPrimary(22.sp, FontWeight.w700);

  static TextStyle get primary14w500 => _fontPrimary(14.sp, FontWeight.w500);

  static TextStyle get primary14w600 => _fontPrimary(14.sp, FontWeight.w600);

  static TextStyle get primary16w700 => _fontPrimary(16.sp, FontWeight.w700);

  static TextStyle get primary14w700 => _fontPrimary(14.sp, FontWeight.w700);

  static TextStyle get fontButton14w400 => _fontButton(14.sp, FontWeight.w400);

  static TextStyle get hintGrey10w600 => _hintGrey(10.sp, FontWeight.w600);
  static TextStyle get hintGrey14w400 => _hintGrey(14.sp, FontWeight.w400);
  static TextStyle get hintGrey14w600 => _hintGrey(14.sp, FontWeight.w600);

  static TextStyle get hintGrey12w400 => _hintGrey(12.sp, FontWeight.w400);

  static TextStyle get hintGrey16w600 => _hintGrey(16.sp, FontWeight.w600);
  static TextStyle get hintGrey18w600 => _hintGrey(18.sp, FontWeight.w600);

  static TextStyle get fontGrey14w500Inter => GoogleFonts.inter(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorConstant.subtitleGreyColor,
  );

  static TextStyle get kTabSelected12 =>
      GoogleFonts.sora(fontSize: 11.sp, color: ColorConstant.primaryColor);

  static TextStyle get kTabUnselected12 =>
      GoogleFonts.sora(fontSize: 11.sp, color: ColorConstant.hintGrey);

  static TextStyle get textDarkBeVietnamPro14w300 =>
      _textDarkBeVietnamPro(14.sp, FontWeight.w300);

  static TextStyle get inputColor14w400 => _inputColor(14.sp, FontWeight.w400);

  static TextStyle _white(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.publicSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Colors.white,
    );
  }

  static TextStyle _inputColor(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.inputColor,
    );
  }

  static TextStyle _hintGrey(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.hintGrey,
    );
  }

  static TextStyle _fontPrimary(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.primaryColor,
    );
  }

  static TextStyle _fontButton(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.buttonColor,
    );
  }

  static TextStyle _fontRed(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.errorRed,
    );
  }

  static TextStyle _textDark(double fontSize, FontWeight fontWeight) {
    return GoogleFonts.publicSans(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.textDark,
    );
  }

  static TextStyle _textNormal(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.textNormal,
    );
  }

  static TextStyle _textLight(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.textLightColor,
    );
  }

  static TextStyle _fontWhite(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.disabledBackground,
    );
  }

  static TextStyle _textDarkBeVietnamPro(
    double fontSize,
    FontWeight fontWeight,
  ) {
    return GoogleFonts.beVietnamPro(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.textDark,
    );
  }

  static TextStyle _textPrimary(double fontSize, FontWeight fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: ColorConstant.primaryColor,
    );
  }
}
