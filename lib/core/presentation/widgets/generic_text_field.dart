import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String icon;
  final bool isPassword;
  final String? Function(String?)? validator;
  final bool enabled;
  const GenericTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.validator,
    this.enabled = true,
  });

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: widget.enabled,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.isPassword ? obscure : false,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: StylesConstants.hintGrey14w600,
        prefixIconConstraints: BoxConstraints(maxHeight: 45.r, maxWidth: 45.r),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GenericImage.lottieAsset(widget.icon, height: 30.r),
        ),
        suffixIcon: widget.isPassword
            ? GenericElevatedButton.circular(
                size: 30.r,
                backgroundColor: ColorConstant.whiteColor,
                splashColor: ColorConstant.disabledBackground,
                icon: GenericImage.lottieAsset(
                  obscure
                      ? ImageConstants.obscureOffLogoLottie
                      : ImageConstants.obscureOnLogoLottie,
                  height: 25.r,
                ),
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
              )
            : null,
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(vertical: 18.h, horizontal: 20.w),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: ColorConstant.textFieldBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(color: ColorConstant.textFieldBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
          borderSide: BorderSide(
            color: ColorConstant.textLightColor,
            width: 1.5,
          ),
        ),
      ),
    );
  }
}
