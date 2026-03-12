import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/features/songs/domain/entities/song_model.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_state.dart';
import 'package:artist_ums/features/songs/presentation/screens/widgets/add_song_title.dart';
import 'package:artist_ums/features/songs/presentation/screens/widgets/artist_chips.dart';
import 'package:artist_ums/features/songs/presentation/screens/widgets/song_title.dart';
import 'package:artist_ums/features/songs/presentation/screens/widgets/songs_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SongsList extends StatelessWidget {
  final List<SongModel> songs;

  const SongsList({super.key, required this.songs});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SongsHeader(songCount: songs.length),
        SliverToBoxAdapter(child: ArtistsFilterChips()),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: BlocBuilder<SongBloc, SongState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () => SliverFillRemaining(
                  child: Center(
                    child: Text(
                      'Could not load songs',
                      style: StylesConstants.hintGrey12w400,
                    ),
                  ),
                ),
                loading: () => SliverFillRemaining(
                  child: Center(child: CupertinoActivityIndicator()),
                ),
                loaded: (songs) => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index == 0) {
                      return const AddSongTile();
                    }
                    final song = songs[index - 1];
                    return SongTile(song: song);
                  }, childCount: songs.length + 1),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
