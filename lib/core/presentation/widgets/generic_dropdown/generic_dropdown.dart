import 'package:artist_ums/core/presentation/widgets/generic_paginating_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

typedef LabelBuilder<T> = String Function(T item);

class GenericDropdown<T> extends FormField<T> {
  final List<T> items;
  final LabelBuilder<T> labelBuilder;

  final String title;
  final String? hintText;

  final bool isMandatory;
  final bool isEnabled;

  final TextStyle? titleTextStyle;
  final TextStyle? style;

  final Color? fillColor;

  final void Function(T?)? onChanged;

  final Future<void> Function()? onLoadMore;
  final VoidCallback? onRetry;

  final Widget? customIcon;

  GenericDropdown({
    super.key,
    required this.items,
    required this.labelBuilder,
    required this.title,
    this.hintText,
    this.isMandatory = false,
    this.isEnabled = true,
    this.titleTextStyle,
    this.style,
    this.fillColor,
    this.onChanged,
    this.onLoadMore,
    this.onRetry,
    this.customIcon,
    super.initialValue,
    super.onSaved,
    super.validator,
    AutovalidateMode autoValidateMode = AutovalidateMode.disabled,
  }) : super(
         autovalidateMode: autoValidateMode,
         builder: (field) {
           return _GenericDropdownBody<T>(
             field: field,
             items: items,
             labelBuilder: labelBuilder,
             title: title,
             hintText: hintText,
             isMandatory: isMandatory,
             isEnabled: isEnabled,
             titleTextStyle: titleTextStyle,
             style: style,
             fillColor: fillColor,
             onChanged: onChanged,
             onLoadMore: onLoadMore,
             onRetry: onRetry,
             customIcon: customIcon,
           );
         },
       );
}

class _GenericDropdownBody<T> extends StatefulWidget {
  final FormFieldState<T> field;

  final List<T> items;
  final LabelBuilder<T> labelBuilder;

  final String title;
  final String? hintText;

  final bool isMandatory;
  final bool isEnabled;

  final TextStyle? titleTextStyle;
  final TextStyle? style;

  final Color? fillColor;

  final void Function(T?)? onChanged;

  final Future<void> Function()? onLoadMore;
  final VoidCallback? onRetry;

  final Widget? customIcon;

  const _GenericDropdownBody({
    required this.field,
    required this.items,
    required this.labelBuilder,
    required this.title,
    this.hintText,
    this.isMandatory = false,
    this.isEnabled = true,
    this.titleTextStyle,
    this.style,
    this.fillColor,
    this.onChanged,
    this.onLoadMore,
    this.onRetry,
    this.customIcon,
  });

  @override
  State<_GenericDropdownBody<T>> createState() =>
      _GenericDropdownBodyState<T>();
}

class _GenericDropdownBodyState<T> extends State<_GenericDropdownBody<T>> {
  final FocusNode _focusNode = FocusNode();

  bool _isExpanded = false;

  bool get hasValue => widget.field.value != null;
  bool get hasFocus => _focusNode.hasFocus || _isExpanded;

  String _getSelectedText() {
    if (widget.field.value == null) {
      return widget.hintText ?? "";
    }

    return widget.labelBuilder(widget.field.value as T);
  }

  void _showBottomSheet() {
    if (!widget.isEnabled) return;

    if (widget.items.isEmpty) {
      widget.onRetry?.call();
      return;
    }

    setState(() => _isExpanded = true);

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) {
        return PaginatedBottomSheet<T>(
          items: widget.items,
          itemBuilder: (item) {
            return ListTile(title: Text(widget.labelBuilder(item)));
          },
          onItemSelected: (selected) {
            widget.field.didChange(selected);
            widget.onChanged?.call(selected);
            context.pop(context);
          },
          onLoadMore: widget.onLoadMore,
          searchMatcher: (item, query) {
            return widget
                .labelBuilder(item)
                .toLowerCase()
                .contains(query.toLowerCase());
          },
        );
      },
    ).whenComplete(() {
      setState(() => _isExpanded = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final showError = widget.field.hasError && widget.field.value == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: _showBottomSheet,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(
                color: showError
                    ? Colors.red
                    : hasFocus
                    ? Colors.blue
                    : Colors.grey.shade300,
              ),
              color: widget.fillColor ?? Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _getSelectedText(),
                    style:
                        widget.style ??
                        TextStyle(
                          fontSize: 14.sp,
                          color: hasValue ? Colors.black : Colors.grey.shade600,
                        ),
                  ),
                ),
                widget.customIcon ??
                    Icon(
                      Icons.keyboard_arrow_down,
                      size: 24.sp,
                      color: Colors.grey,
                    ),
              ],
            ),
          ),
        ),

        if (showError)
          Padding(
            padding: EdgeInsets.only(top: 6.h),
            child: Text(
              widget.field.errorText ?? "",
              style: TextStyle(fontSize: 12.sp, color: Colors.red),
            ),
          ),
      ],
    );
  }
}
