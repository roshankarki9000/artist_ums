import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericElevatedButton extends StatelessWidget {
  static TextStyle get buttonTextStyle => StylesConstants.fontWhite14w500;

  final String title;
  final bool loading;
  final VoidCallback? onPressed;
  final bool isDisabled;
  final double? height;
  final double? width;
  final TextStyle? textStyle;
  final double? elevation;
  final Color? backgroundColor;
  final Color? splashColor;
  final EdgeInsets? padding;
  final Widget? extraSuffix;
  final bool isPadding;
  final BorderSide? borderSide;

  /// Replaces title
  final Widget? child;

  final Widget? prefix;

  /// Shape support (circle, stadium, etc.)
  final OutlinedBorder? shape;

  /// Secondary button
  factory GenericElevatedButton.secondary({
    required String title,
    required VoidCallback onPressed,
    Widget? prefix,
    bool isPadding = true,
  }) {
    return GenericElevatedButton(
      splashColor: ColorConstant.buttonSoftSplash,
      backgroundColor: ColorConstant.buttonSoftColor,
      prefix: prefix,
      textStyle: GenericElevatedButton.buttonTextStyle.copyWith(
        color: ColorConstant.buttonColor,
      ),
      onPressed: onPressed,
      title: title,
      isPadding: isPadding,
    );
  }

  /// Circular button
  factory GenericElevatedButton.circular({
    required VoidCallback onPressed,
    required Widget icon,
    double size = 46,
    Color? backgroundColor,
    Color? splashColor,
    BorderSide? borderSide,
  }) {
    return GenericElevatedButton(
      title: '',
      height: size,
      width: size,
      splashColor: splashColor ?? ColorConstant.buttonSplash,
      backgroundColor: backgroundColor ?? ColorConstant.buttonColor,
      borderSide: borderSide,
      shape: const CircleBorder(),
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      isPadding: false,
      child: Center(child: icon),
    );
  }

  const GenericElevatedButton({
    super.key,
    required this.title,
    this.prefix,
    this.borderSide,
    this.isDisabled = false,
    this.onPressed,
    this.height,
    this.width,
    this.textStyle,
    this.loading = false,
    this.child,
    this.elevation,
    this.backgroundColor,
    this.splashColor,
    this.padding,
    this.extraSuffix,
    this.isPadding = true,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    final prefix = this.prefix;

    return Glow(
      opacity: .2,
      scale: .7,
      child: Container(
        height: height ?? 46.h,
        width: width ?? MediaQuery.of(context).size.width,
        margin: EdgeInsets.only(bottom: !isPadding ? 0 : 12.h),
        child: Semantics(
          label: title,
          child: ElevatedButton(
            style: buildButtonStyle(
              context,
              isDisabled: isDisabled,
              elevation: elevation,
              backgroundColor: backgroundColor,
              splashColor: splashColor,
              padding: padding,
              side: borderSide,
              shape: shape,
            ),
            onPressed: (isDisabled || loading) ? null : onPressed,
            child: DefaultTextStyle(
              style: textStyle ?? buttonTextStyle,
              child: loading
                  ? Center(
                      child: CupertinoActivityIndicator(
                        color: ColorConstant.whiteColor,
                      ),
                    )
                  : child ??
                        Text.rich(
                          TextSpan(
                            children: [
                              if (prefix != null)
                                WidgetSpan(
                                  child: prefix,
                                  alignment: PlaceholderAlignment.middle,
                                ),
                              TextSpan(text: title),
                              if (extraSuffix != null)
                                WidgetSpan(
                                  child: extraSuffix!,
                                  alignment: PlaceholderAlignment.middle,
                                ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
            ),
          ),
        ),
      ),
    );
  }

  static ButtonStyle buildButtonStyle(
    BuildContext context, {
    double? elevation,
    bool isDisabled = false,
    Color? backgroundColor,
    Color? splashColor,
    EdgeInsets? padding,
    BorderSide? side,
    OutlinedBorder? shape,
  }) {
    var buttonColor = ColorConstant.buttonColor;

    return ButtonStyle(
      side: side == null
          ? null
          : WidgetStateProperty.resolveWith<BorderSide>((states) => side),
      padding: padding == null
          ? null
          : WidgetStateProperty.resolveWith<EdgeInsetsGeometry>(
              (states) => padding,
            ),
      overlayColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.pressed)
            ? splashColor ?? ColorConstant.buttonSplash
            : null;
      }),
      elevation: WidgetStateProperty.all(elevation ?? 0),
      backgroundColor: WidgetStateProperty.all(
        isDisabled
            ? Theme.of(context).disabledColor
            : backgroundColor ?? buttonColor,
      ),
      splashFactory: InkRipple.splashFactory,
      shape: WidgetStateProperty.all(
        shape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.r)),
      ),
    );
  }
}
