import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/glow.dart';
import 'package:artist_ums/core/utils/extensions/num_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCalendar extends StatefulWidget {
  final EdgeInsets contentPadding;
  const CustomCalendar({
    super.key,
    this.contentPadding = const EdgeInsets.only(
      left: 22,
      right: 22,
      top: 0,
      bottom: 30,
    ),
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  late int selectedIndex;
  late List<DateTime> weekDates;
  final ScrollController _scrollController = ScrollController();

  final List<String> weekDays = [
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
    'Sat',
    'Sun',
  ];

  @override
  void initState() {
    super.initState();
    _generateWeekDates();
    _setSelectedToday();

    // Scroll to the selected index after first frame
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelected();
    });
  }

  void _generateWeekDates() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    weekDates = List.generate(7, (index) => monday.add(Duration(days: index)));
  }

  void _setSelectedToday() {
    final today = DateTime.now();
    selectedIndex = weekDates.indexWhere(
      (date) =>
          date.year == today.year &&
          date.month == today.month &&
          date.day == today.day,
    );
  }

  void _scrollToSelected() {
    // Width of each item + margin
    final itemWidth = 80.0.w;
    final itemMargin = 15.0.w;
    final totalItemWidth = itemWidth + itemMargin;

    // Calculate scroll offset to center the selected item
    final screenWidth = MediaQuery.of(context).size.width;
    final offset =
        ((totalItemWidth * selectedIndex) - (screenWidth / 2) + (itemWidth / 2))
            .w;

    _scrollController.animateTo(
      offset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: _scrollController,
      padding: widget.contentPadding,
      child: Row(
        children: List.generate(7, (index) {
          final bool isSelected = index == selectedIndex;
          return Glow(
            blurStrength: 15,
            glowOffset: 15.w,
            child: Container(
              width: 80.r,
              height: 80.r,
              margin: EdgeInsets.only(right: 15.w),
              decoration: BoxDecoration(
                boxShadow: isSelected
                    ? []
                    : [
                        BoxShadow(
                          color: Colors.black.withAlpha(25),
                          blurRadius: 15,
                          offset: Offset(0, 5.w),
                        ),
                      ],
                color: isSelected
                    ? ColorConstant.primaryColor
                    : ColorConstant.whiteColor,
                borderRadius: BorderRadius.circular(18.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 5.h,
                children: [
                  Text(
                    weekDates[index].day.twoDigits,
                    style: StylesConstants.textDark18w600.copyWith(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                  Text(
                    weekDays[index],
                    style: StylesConstants.textDark16w600.copyWith(
                      color: isSelected ? Colors.white : null,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
