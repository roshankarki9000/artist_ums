import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class UsersHeader extends StatelessWidget {
  final int count;

  const UsersHeader({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new,
          size: 20.sp,
          color: ColorConstant.whiteColor,
        ),
        onPressed: () => context.pop(),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                ColorConstant.primaryShade1,
                ColorConstant.primaryShade2,
                ColorConstant.whiteColor,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: EdgeInsets.fromLTRB(16.w, 100.h, 16.w, 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Users", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text("$count users", style: StylesConstants.hintGrey14w400),
            ],
          ),
        ),
      ),
    );
  }
}
