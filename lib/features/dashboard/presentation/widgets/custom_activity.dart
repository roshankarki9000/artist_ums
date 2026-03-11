import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/widgets/glow.dart';
import 'package:artist_ums/core/utils/extensions/date_time_extension.dart';
import 'package:artist_ums/core/utils/extensions/num_extension.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:artist_ums/features/dashboard/presentation/widgets/generic_grid_view.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_state.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Activity extends StatelessWidget {
  final EdgeInsets contentPadding;
  const Activity({
    super.key,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 22),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: contentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10.h,
        children: [
          Text('Top Activities', style: StylesConstants.textDark20w600),
          GenericGridview(
            crossAxisCount: 2,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 10.w,
            children: [
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    usersLoaded: (user) => _Activities(
                      title: 'Users',
                      color: Color(0xFF0C0412),
                      iconPath: ImageConstants.userLogoGif,
                      value: user.length.twoDigits,
                      subtitle: 'Total Users',
                    ),
                    orElse: () =>
                        const Center(child: CupertinoActivityIndicator()),
                  );
                },
              ),

              BlocBuilder<ArtistBloc, ArtistState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (user) => _Activities(
                      title: 'Artists',
                      color: Color(0xFFEDCA7C),
                      iconPath: ImageConstants.artistsLogoGif,
                      value: user.length.twoDigits,
                      subtitle: 'Artists Created',
                    ),
                    orElse: () =>
                        const Center(child: CupertinoActivityIndicator()),
                  );
                },
              ),
              BlocBuilder<SongBloc, SongState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loaded: (user) => _Activities(
                      title: 'Songs',
                      color: Color(0xFF3F51B5),
                      iconPath: ImageConstants.musicLogoGif,
                      value: user.length.twoDigits,
                      subtitle: 'Music Recorded',
                    ),
                    orElse: () =>
                        const Center(child: CupertinoActivityIndicator()),
                  );
                },
              ),
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    authenticated: (user) => _Activities(
                      title: 'Total Days',
                      color: Color(0xFFC6D337),
                      iconPath: ImageConstants.workingDaysLogoGif,
                      value: user.createdAt.getWorkingDaysTillNow.twoDigits,
                      subtitle: 'Working Days',
                    ),
                    orElse: () =>
                        const Center(child: CupertinoActivityIndicator()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Activities extends StatelessWidget {
  final String title;
  final Color color;
  final String iconPath;
  final String value;
  final String subtitle;
  const _Activities({
    required this.title,
    required this.color,
    required this.iconPath,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Glow(
      child: Container(
        height: 145.h,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: Column(
          spacing: 8.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10.w,
              children: [
                Glow(
                  opacity: 1,
                  blurStrength: 35,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.r),
                    child: GenericImage.asset(
                      iconPath,
                      height: 35.r,
                      width: 35.r,
                    ),
                  ),
                ),
                Text(title, style: StylesConstants.white14w400),
              ],
            ),
            Text(value, style: StylesConstants.white24w600),
            Text(subtitle, style: StylesConstants.white16w600),
          ],
        ),
      ),
    );
  }
}
