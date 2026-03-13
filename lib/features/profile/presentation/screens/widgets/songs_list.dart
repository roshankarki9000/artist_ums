import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/features/profile/domain/entities/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongsList extends StatelessWidget {
  final List<SongModel> songs;
  const SongsList(this.songs, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(2.r),
      itemCount: songs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.w,
        childAspectRatio: .7,
      ),
      itemBuilder: (context, index) {
        final song = songs[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            song.coverUrl != null
                ? GenericImage.network(song.coverUrl!, fit: BoxFit.cover)
                : Container(color: ColorConstant.disabledBackground1),
            Positioned.fill(
              child: ColoredBox(
                color: ColorConstant.darkModeSecondary.withAlpha(30),
              ),
            ),
            Positioned(
              left: 10.w,
              right: 0,
              bottom: 10.h,
              top: 10.h,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    song.artistName,
                    style: StylesConstants.white16w700.copyWith(
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Text(
                    song.title,
                    style: StylesConstants.white14w500,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
