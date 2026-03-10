import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    primaryColor: ColorConstant.primaryColor,
    useMaterial3: true,
    scaffoldBackgroundColor: ColorConstant.backgroundColor,
    colorScheme: ColorScheme.light(primary: ColorConstant.primaryColor),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
    ),
    checkboxTheme: CheckboxThemeData(
      side: WidgetStateBorderSide.resolveWith(
        (states) => BorderSide(color: ColorConstant.borderColor, width: 1.0),
      ),
      fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.selected)) {
          return ColorConstant.primaryColor;
        }
        return ColorConstant.textFormColor;
      }),
      overlayColor: WidgetStateProperty.all(Colors.transparent),
    ),
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.white),
    textTheme: GoogleFonts.publicSansTextTheme(),
  );
}
