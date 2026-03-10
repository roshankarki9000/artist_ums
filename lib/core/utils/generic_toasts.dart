import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/di/get_it_config/get_it.dart';
import 'package:artist_ums/core/constants/key_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ToastType { success, error, warning }

void showCustomSuccessToast(String value) {
  _showCustomToast(value, ToastType.success);
}

void showCustomWarningToast(String value) {
  _showCustomToast(value, ToastType.warning);
}

void showCustomErrorToast(String value) {
  _showCustomToast(value, ToastType.error);
}

void _showCustomToast(String text, ToastType type, {Widget? extraChild}) async {
  await Future.delayed(Duration.zero);

  final messenger = getIt<KeyConstants>().scaffoldMessengerKey.currentState;

  if (messenger == null) return;

  messenger
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        padding: EdgeInsets.zero,
        backgroundColor: Colors.transparent,
        content: getCustomSnackBar(text, type, extraChild: extraChild),
      ),
    );
}

Widget getCustomSnackBar(String text, ToastType type, {Widget? extraChild}) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 15.h),
    padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 16.h),
    decoration: BoxDecoration(
      boxShadow: const [
        BoxShadow(
          offset: Offset(0, 10),
          blurRadius: 10,
          spreadRadius: -5,
          color: Color.fromRGBO(0, 0, 0, 0.04),
        ),
        BoxShadow(
          offset: Offset(0, 20),
          blurRadius: 25,
          spreadRadius: -5,
          color: Color.fromRGBO(0, 0, 0, 0.02),
        ),
      ],
      color: _getColor(type),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(_getIcon(type), color: Colors.white),
            SizedBox(width: 16.w),
            Expanded(child: Text(text, style: _getStyle(type))),
            InkWell(
              onTap: () {
                getIt<KeyConstants>().scaffoldMessengerKey.currentState
                    ?.hideCurrentSnackBar();
              },
              child: Padding(
                padding: EdgeInsets.all(4.0.w),
                child: Icon(
                  Icons.close_rounded,
                  color: Colors.white,
                  size: 18.r,
                ),
              ),
            ),
          ],
        ),
        if (extraChild != null) ...[SizedBox(height: 12.h), extraChild],
      ],
    ),
  );
}

Color _getColor(ToastType type) {
  return switch (type) {
    ToastType.success => ColorConstant.primaryColor,
    ToastType.error => ColorConstant.errorRed,
    ToastType.warning => ColorConstant.warningToast,
  };
}

IconData _getIcon(ToastType type) {
  return switch (type) {
    ToastType.success => Icons.info_outline_rounded,
    ToastType.warning => Icons.warning_amber_rounded,
    ToastType.error => Icons.cancel_outlined,
  };
}

TextStyle _getStyle(ToastType type) {
  return switch (type) {
    ToastType.error => StylesConstants.fontWhite14w700,
    _ => StylesConstants.fontWhite14w500,
  };
}
