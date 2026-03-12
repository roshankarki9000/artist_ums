import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ArtistsPage extends StatelessWidget {
  const ArtistsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const _ArtistsView();
  }
}

class _ArtistsView extends StatelessWidget {
  const _ArtistsView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: BlocBuilder<ArtistBloc, ArtistState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),

            loaded: (artists) {
              return CustomScrollView(
                slivers: [
                  _ArtistsHeader(count: artists.length),

                  SliverPadding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        if (index == 0) {
                          return const _AddArtistTile();
                        }

                        final artist = artists[index - 1];
                        return _ArtistTile(artist: artist);
                      }, childCount: artists.length + 1),
                    ),
                  ),
                ],
              );
            },

            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}

class _ArtistsHeader extends StatelessWidget {
  final int count;

  const _ArtistsHeader({required this.count});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.h,
      pinned: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
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
              Text("Artists", style: StylesConstants.textDark24w700),
              SizedBox(height: 4.h),
              Text("$count artists", style: StylesConstants.hintGrey14w400),
            ],
          ),
        ),
      ),
    );
  }
}

class _AddArtistTile extends StatelessWidget {
  const _AddArtistTile();

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
      onTap: () => context.push('/artists/create-artist'),
    );
  }
}

class _ArtistTile extends StatelessWidget {
  final ArtistModel artist;

  const _ArtistTile({required this.artist});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 6.h),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(50.r),
        child: artist.coverUrl != null
            ? GenericImage.network(
                artist.coverUrl!,
                width: 50.r,
                height: 50.r,
                fit: BoxFit.cover,
              )
            : Container(
                width: 50.r,
                height: 50.r,
                color: ColorConstant.disabledBackground1,
                child: Center(
                  child: GenericImage.asset(
                    ImageConstants.noArtistLogoGif,
                    width: 35.r,
                    height: 35.r,
                  ),
                ),
              ),
      ),

      title: Text(artist.name, style: StylesConstants.textDark16w600),
      subtitle: Text(
        artist.bio ?? "N/A",
        style: StylesConstants.textDark14w400,
      ),
      trailing: const Icon(Icons.more_vert),
      onTap: () {
        context.push('/artists/edit-artist/${artist.id}');
      },
    );
  }
}
