import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/features/profile/domain/entities/profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistsList extends StatelessWidget {
  final List<ArtistModel> artists;
  const ArtistsList(this.artists, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(2.r),
      itemCount: artists.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2.w,
        mainAxisSpacing: 2.w,
        childAspectRatio: .7,
      ),
      itemBuilder: (context, index) {
        final artist = artists[index];
        return Stack(
          fit: StackFit.expand,
          children: [
            artist.coverUrl != null
                ? GenericImage.network(artist.coverUrl!, fit: BoxFit.cover)
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
                    '${artist.songsWritten} Songs',
                    style: StylesConstants.white16w700,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: artist.name),
                        TextSpan(text: '\n'),
                        TextSpan(
                          text: artist.bio ?? 'N/a',
                          style: TextStyle(fontSize: 12.sp),
                        ),
                      ],
                    ),
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
