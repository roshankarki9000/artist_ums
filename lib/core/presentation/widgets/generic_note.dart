import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';

class GenericNote extends StatelessWidget {
  const GenericNote({super.key, required this.title, required this.titleValue});

  final String title;
  final String titleValue;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: TextStyle(color: ColorConstant.textDark),
          ),
          TextSpan(
            text: titleValue,
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
      style: StylesConstants.hintGrey10w600,
    );
  }
}
