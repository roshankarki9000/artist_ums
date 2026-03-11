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
               color: appbarColor ?? Theme.of(context).scaffoldBackgroundColor,
               child: Stack(
                 children: [
                   Positioned.fill(
                     top: appBar == null
                         ? MediaQuery.of(context).padding.top
                         : 0,
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
