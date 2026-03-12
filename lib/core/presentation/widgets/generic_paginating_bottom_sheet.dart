import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

typedef ItemBuilder<T> = Widget Function(T item);
typedef OnItemSelected<T> = void Function(T selected);
typedef FetchMoreCallback = Future<void> Function();
typedef SearchMatcher<T> = bool Function(T item, String query);

class PaginatedBottomSheet<T> extends StatefulWidget {
  final List<T> items;
  final ItemBuilder<T> itemBuilder;
  final OnItemSelected<T> onItemSelected;
  final FetchMoreCallback? onLoadMore;
  final bool isLoadingMore;

  final SearchMatcher<T>? searchMatcher;

  const PaginatedBottomSheet({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onItemSelected,
    this.onLoadMore,
    this.isLoadingMore = false,
    this.searchMatcher,
  });

  @override
  State<PaginatedBottomSheet<T>> createState() =>
      _PaginatedBottomSheetState<T>();
}

class _PaginatedBottomSheetState<T> extends State<PaginatedBottomSheet<T>>
    with SingleTickerProviderStateMixin {
  final DraggableScrollableController _sheetController =
      DraggableScrollableController();

  final TextEditingController _searchController = TextEditingController();

  late final AnimationController _arrowController;
  late final Animation<double> _arrowAnimation;

  bool _isExpanded = false;

  late List<T> filteredItems;

  @override
  void initState() {
    super.initState();

    filteredItems = widget.items;

    _arrowController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);

    _arrowAnimation = Tween<double>(begin: 0, end: 10).animate(
      CurvedAnimation(parent: _arrowController, curve: Curves.easeInOut),
    );

    _searchController.addListener(_filterItems);
  }

  void _filterItems() {
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      setState(() => filteredItems = widget.items);
      return;
    }

    if (widget.searchMatcher != null) {
      setState(() {
        filteredItems = widget.items
            .where((e) => widget.searchMatcher!(e, query))
            .toList();
      });
    } else {
      /// fallback
      setState(() {
        filteredItems = widget.items
            .where((e) => e.toString().toLowerCase().contains(query))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _arrowController.dispose();
    _sheetController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void _toggleSheet() {
    final newSize = _isExpanded ? 0.21 : 0.9;
    _sheetController.animateTo(
      newSize,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _isExpanded = !_isExpanded);
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _sheetController,
      expand: false,
      initialChildSize: 0.6,
      minChildSize: 0.2,
      maxChildSize: 0.9,
      builder: (_, controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 10.h),

                  /// 🔍 SEARCH FIELD
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        isDense: true,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.h),

                  Expanded(
                    child: NotificationListener<ScrollNotification>(
                      onNotification: (scrollInfo) {
                        if (!widget.isLoadingMore &&
                            scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                          widget.onLoadMore?.call();
                        }
                        return false;
                      },
                      child: ListView.builder(
                        controller: controller,
                        itemCount:
                            filteredItems.length +
                            (widget.isLoadingMore ? 1 : 0),
                        itemBuilder: (context, index) {
                          if (index >= filteredItems.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: CupertinoActivityIndicator(),
                              ),
                            );
                          }

                          final item = filteredItems[index];

                          return InkWell(
                            onTap: () => widget.onItemSelected(item),
                            child: widget.itemBuilder(item),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),

              /// ⬆️ EXPAND / COLLAPSE BUTTON
              Positioned(
                bottom: 12,
                left: 0,
                right: 0,
                child: GestureDetector(
                  onTap: _toggleSheet,
                  child: Center(
                    child: AnimatedBuilder(
                      animation: _arrowAnimation,
                      builder: (context, child) {
                        return Transform.translate(
                          offset: Offset(0, _arrowAnimation.value),
                          child: Icon(
                            _isExpanded
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            size: 30,
                            color: Colors.grey.shade600,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
