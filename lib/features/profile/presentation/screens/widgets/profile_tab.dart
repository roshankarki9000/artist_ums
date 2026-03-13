import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_dialog.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_state.dart';
import 'package:artist_ums/features/profile/presentation/screens/widgets/artist_list.dart'
    show ArtistsList;
import 'package:artist_ums/features/profile/presentation/screens/widgets/avatar_widget.dart';
import 'package:artist_ums/features/profile/presentation/screens/widgets/songs_list.dart'
    show SongsList;
import 'package:artist_ums/features/profile/presentation/screens/widgets/stat_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final profile = state.maybeWhen(
          loaded: (profile) => profile,
          orElse: () => null,
        );

        final loading = state.maybeWhen(
          loading: () => true,
          orElse: () => false,
        );

        return DefaultTabController(
          length: 2,

          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverAppBar(
                expandedHeight: 330.h,
                pinned: true,
                elevation: 0,
                backgroundColor: ColorConstant.whiteColor,
                automaticallyImplyLeading: false,
                actions: [
                  PopupMenuButton(
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        onTap: () => context.push('/profile/edit'),
                        value: 'editProfile',
                        child: Text(
                          "Edit Profile",
                          style: StylesConstants.textDark16w400,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => GenericDialog.show(
                          context,
                          title: 'Logout',
                          subtitle: 'Are you sure you want to logout?',
                          onYes: () =>
                              context.read<AuthBloc>().add(AuthEvent.logout()),
                        ),
                        value: 'logout',
                        child: Text(
                          "Logout",
                          style: StylesConstants.textDark16w400,
                        ),
                      ),
                    ],
                  ),
                ],
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
                    padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 0),
                    child: Column(
                      children: [
                        if (loading)
                          SizedBox(
                            width: 120.r,
                            height: 120.r,
                            child: const CupertinoActivityIndicator(),
                          )
                        else if (profile != null)
                          AvatarWidget(profile: profile),
                        SizedBox(height: 12.h),
                        if (!loading && profile != null) ...[
                          Text(
                            profile.name,
                            style: StylesConstants.textDark20w700,
                          ),
                          SizedBox(height: 4.h),
                          Text(
                            profile.email,
                            style: StylesConstants.hintGrey14w400,
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              StatTile(
                                value: profile.artistsCreated.toString(),
                                label: "Artists",
                              ),
                              SizedBox(width: 40.w),
                              StatTile(
                                value: profile.songsCreated.toString(),
                                label: "Songs",
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                bottom: TabBar(
                  indicatorColor: ColorConstant.primaryColor,
                  dividerColor: Colors.transparent,
                  indicator: UnderlineTabIndicator(
                    borderRadius: BorderRadius.circular(5.r),
                    borderSide: BorderSide(
                      width: 3.h,
                      color: ColorConstant.primaryColor,
                    ),
                    insets: EdgeInsets.symmetric(horizontal: 100.w),
                  ),
                  tabs: [
                    Tab(
                      icon: GenericImage.asset(ImageConstants.artistsLogoGif),
                    ),
                    Tab(icon: GenericImage.asset(ImageConstants.musicLogoGif)),
                  ],
                ),
              ),
            ],
            body: state.maybeWhen(
              loaded: (profile) => ColoredBox(
                color: Colors.white,
                child: TabBarView(
                  children: [
                    ArtistsList(profile.artists),
                    SongsList(profile.songs),
                  ],
                ),
              ),
              loading: () => const Center(child: CupertinoActivityIndicator()),
              error: (msg) => Center(child: Text(msg)),
              orElse: () => const SizedBox(),
            ),
          ),
        );
      },
    );
  }
}
