import 'package:artist_ums/features/artists/domain/entities/artist_model.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';
import 'package:artist_ums/features/artists/presentation/screens/widgets/add_artist_title.dart';
import 'package:artist_ums/features/artists/presentation/screens/widgets/artist_header.dart';
import 'package:artist_ums/features/artists/presentation/screens/widgets/artist_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArtistsList extends StatelessWidget {
  final List<ArtistModel> artists;

  const ArtistsList({super.key, required this.artists});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        ArtistsHeader(count: artists.length),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: BlocBuilder<ArtistBloc, ArtistState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SliverFillRemaining(
                  child: Center(child: CupertinoActivityIndicator()),
                ),
                loaded: (artists) => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index == 0) return const AddArtistTile();

                    final artist = artists[index - 1];
                    return ArtistTile(artist: artist);
                  }, childCount: artists.length + 1),
                ),
                orElse: () => const SliverFillRemaining(
                  child: Center(child: Text('Could not load artists')),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
