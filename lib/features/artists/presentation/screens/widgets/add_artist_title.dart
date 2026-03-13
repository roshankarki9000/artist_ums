import 'package:artist_ums/core/app_router/app_routes.dart';
import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddArtistTile extends StatelessWidget {
  const AddArtistTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 12.h),
      leading: Container(
        height: 50.r,
        width: 50.r,
        decoration: BoxDecoration(
          color: ColorConstant.disabledBackground1,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: const Icon(Icons.add),
      ),
      title: Text("Add artist", style: StylesConstants.textDark16w600),
      onTap: () => CreateArtistRoute().push(context),
    );
  }
}
