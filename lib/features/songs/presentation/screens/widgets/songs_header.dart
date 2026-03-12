import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongsHeader extends StatelessWidget {
  final int songCount;

  const SongsHeader({super.key, required this.songCount});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      elevation: 0,
      automaticallyImplyLeading: false,

      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: ColorConstant.whiteColor,
          size: 20.sp,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
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
              Text("Songs", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text("$songCount songs", style: StylesConstants.hintGrey14w400),
            ],
          ),
        ),
      ),
    );
  }
}
