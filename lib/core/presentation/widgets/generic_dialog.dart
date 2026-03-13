import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class GenericDialog {
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String subtitle,
    VoidCallback? onYes,
    VoidCallback? onNo,
  }) {
    return showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: "Confirm",
      barrierColor: ColorConstant.darkModePrimary.withAlpha(200),
      transitionDuration: const Duration(milliseconds: 250),
      pageBuilder: (context, animation, secondaryAnimation) => const SizedBox(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curved = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutBack,
        );

        return Transform.scale(
          scale: curved.value,
          child: Opacity(
            opacity: animation.value,
            child: Center(
              child: _DialogContent(
                title: title,
                subtitle: subtitle,
                onYes: () {
                  context.pop(context);
                  onYes?.call();
                },
                onNo: () {
                  context.pop(context);
                  onNo?.call();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class _DialogContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onYes;
  final VoidCallback onNo;

  const _DialogContent({
    required this.title,
    required this.subtitle,
    required this.onYes,
    required this.onNo,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 320.w,
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: ColorConstant.whiteColor,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: ColorConstant.darkModePrimary.withAlpha(150),
              blurRadius: 20.r,
              offset: Offset(0, 10.w),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: StylesConstants.textDark18w700,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),

            Text(
              subtitle,
              style: StylesConstants.hintGrey14w400,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            Row(
              children: [
                Expanded(
                  child: GenericElevatedButton.secondary(
                    title: "No",
                    onPressed: onNo,
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GenericElevatedButton(
                    title: "Yes",
                    backgroundColor: ColorConstant.primaryColor,
                    onPressed: onYes,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
