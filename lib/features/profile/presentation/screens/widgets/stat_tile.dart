import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';

class StatTile extends StatelessWidget {
  final String value;
  final String label;
  const StatTile({required this.value, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: value, style: StylesConstants.textDark18w700),
              TextSpan(text: '\n'),
              TextSpan(text: label, style: StylesConstants.hintGrey14w400),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
