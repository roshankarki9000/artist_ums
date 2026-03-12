import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericSafeArea extends StatelessWidget {
  final Widget child;
  final Color? backgroundColor;

  const GenericSafeArea({super.key, required this.child, this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      return child;
    }
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Platform.isIOS
            ? Brightness.light
            : Platform.isAndroid
            ? Brightness.dark
            : null,
        statusBarIconBrightness: Platform.isIOS
            ? Brightness.light
            : Platform.isAndroid
            ? Brightness.dark
            : null,
        systemNavigationBarIconBrightness: Platform.isIOS
            ? Brightness.light
            : Platform.isAndroid
            ? Brightness.dark
            : null,
        systemNavigationBarColor: Platform.isIOS
            ? null
            : Platform.isAndroid
            ? Colors.transparent
            : null,
      ),
      child: Stack(
        children: [
          Positioned.fill(top: 0, child: child),
          IgnorePointer(
            ignoring: true,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(color: Colors.transparent),
            ),
          ),
        ],
      ),
    );
  }
}
