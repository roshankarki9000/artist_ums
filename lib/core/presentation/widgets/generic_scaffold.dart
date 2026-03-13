import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenericScaffold extends Scaffold {
  GenericScaffold({
    super.key,
    required Widget body,
    List<Widget>? actions,
    super.drawer,
    super.floatingActionButton,
    super.resizeToAvoidBottomInset,
    Color? backgroundColor,
    Color? appbarColor,
    super.floatingActionButtonLocation,
    PreferredSizeWidget? appBar,
    Widget? bottomNavigationBar,
    bool enableDoubleTapExit = false,
  }) : super(
         body: _DoubleTapExitWrapper(
           enableDoubleTapExit: enableDoubleTapExit,
           backgroundColor: backgroundColor,
           appBar: appBar,
           bottomNavigationBar: bottomNavigationBar,
           body: body,
         ),
       );
}

class _DoubleTapExitWrapper extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool enableDoubleTapExit;

  const _DoubleTapExitWrapper({
    required this.body,
    required this.enableDoubleTapExit,
    this.appBar,
    this.bottomNavigationBar,
    this.backgroundColor,
  });

  @override
  State<_DoubleTapExitWrapper> createState() => _DoubleTapExitWrapperState();
}

class _DoubleTapExitWrapperState extends State<_DoubleTapExitWrapper> {
  DateTime? _lastBackPressed;

  void _handlePop(bool didPop, Object? result) {
    if (!widget.enableDoubleTapExit) return;

    final now = DateTime.now();

    if (_lastBackPressed == null ||
        now.difference(_lastBackPressed!) > const Duration(seconds: 2)) {
      _lastBackPressed = now;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: ColorConstant.disabledBackground,
          content: Text(
            "Double tap to exit",
            style: StylesConstants.textDark12w400,
          ),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !widget.enableDoubleTapExit,
      onPopInvokedWithResult: _handlePop,
      child: ColoredBox(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned.fill(
              child: Column(
                children: [
                  widget.appBar ?? const SizedBox(),
                  Expanded(
                    child: Container(
                      color:
                          widget.backgroundColor ??
                          Theme.of(context).scaffoldBackgroundColor,
                      width: double.infinity,
                      child: widget.body,
                    ),
                  ),
                  if (widget.bottomNavigationBar != null)
                    Container(
                      color:
                          widget.backgroundColor ??
                          Theme.of(context).scaffoldBackgroundColor,
                      child: widget.bottomNavigationBar,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
