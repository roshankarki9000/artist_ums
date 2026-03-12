import 'package:flutter/material.dart';

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
  }) : super(
         body: Builder(
           builder: (context) {
             return ColoredBox(
               color: Colors.transparent,
               child: Stack(
                 children: [
                   Positioned.fill(
                     child: Column(
                       children: [
                         appBar ?? const SizedBox(),
                         Expanded(
                           child: Container(
                             color:
                                 backgroundColor ??
                                 Theme.of(context).scaffoldBackgroundColor,
                             width: double.infinity,
                             child: body,
                           ),
                         ),
                         if (bottomNavigationBar != null)
                           Container(
                             color:
                                 backgroundColor ??
                                 Theme.of(context).scaffoldBackgroundColor,
                             child: bottomNavigationBar,
                           ),
                       ],
                     ),
                   ),
                 ],
               ),
             );
           },
         ),
       );
}
