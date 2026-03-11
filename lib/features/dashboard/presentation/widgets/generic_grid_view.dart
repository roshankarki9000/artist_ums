import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericGridview extends StatefulWidget {
  final String customMessage;
  final int crossAxisCount;
  final List<Widget> children;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final EdgeInsetsGeometry? contentPadding;
  final Widget Function()? onEmpty;
  const GenericGridview({
    super.key,
    required this.crossAxisCount,
    required this.children,
    this.crossAxisSpacing = 5,
    this.mainAxisSpacing = 5,
    this.contentPadding,
    this.customMessage = '',
    this.onEmpty,
  });

  @override
  State<GenericGridview> createState() => _GenericGridviewState();
}

class _GenericGridviewState extends State<GenericGridview> {
  @override
  Widget build(BuildContext context) {
    return buildRows();
  }

  Widget buildRows() {
    List<Widget> rows = [];
    for (int i = 0; i < widget.children.length; i += widget.crossAxisCount) {
      List<Widget> rowChildren = [];
      for (
        int j = i;
        j < i + widget.crossAxisCount && j < widget.children.length;
        j++
      ) {
        rowChildren.add(Expanded(child: widget.children[j]));
      }
      if (rowChildren.length < widget.crossAxisCount) {
        for (int k = 0; k <= widget.crossAxisCount - rowChildren.length; k++) {
          rowChildren.add(const Expanded(child: SizedBox()));
        }
      }

      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: getCrossAxisCount(rowChildren),
          ),
        ),
      );
    }
    rows = getMainAxisSpacing(rows);
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      padding: widget.contentPadding,
      child: Column(
        children: widget.children.isEmpty
            ? [
                widget.onEmpty?.call() ??
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 35.h,
                      ),
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          widget.customMessage,
                          style: StylesConstants.hintGrey12w400,
                        ),
                      ),
                    ),
              ]
            : rows,
      ),
    );
  }

  List<Widget> getCrossAxisCount(List<Widget> rowChildren) {
    List<Widget> spacedChildren = [];

    for (int i = 0; i < rowChildren.length; i++) {
      spacedChildren.add(rowChildren[i]);

      if (i < rowChildren.length - 1) {
        spacedChildren.add(SizedBox(width: widget.crossAxisSpacing));
      }
    }
    return spacedChildren;
  }

  List<Widget> getMainAxisSpacing(List<Widget> rowChildren) {
    List<Widget> spacedChildren = [];

    for (int i = 0; i < rowChildren.length; i++) {
      spacedChildren.add(rowChildren[i]);

      if (i < rowChildren.length - 1) {
        spacedChildren.add(SizedBox(height: widget.mainAxisSpacing));
      }
    }
    return spacedChildren;
  }
}
