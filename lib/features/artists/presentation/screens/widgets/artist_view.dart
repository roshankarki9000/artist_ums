import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_state.dart';
import 'package:artist_ums/features/artists/presentation/screens/widgets/artist_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';

class ArtistsView extends StatelessWidget {
  const ArtistsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: BlocBuilder<ArtistBloc, ArtistState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const ArtistsList(artists: []),
            error: (msg) => Center(child: Text(msg)),
            loaded: (artists) => ArtistsList(artists: artists),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
