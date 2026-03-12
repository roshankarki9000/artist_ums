import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_event.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_state.dart';
import 'package:artist_ums/features/songs/presentation/screens/widgets/songs_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SongsPage extends StatefulWidget {
  final String? id;

  const SongsPage({super.key, this.id});

  @override
  State<SongsPage> createState() => _SongsPageState();
}

class _SongsPageState extends State<SongsPage> {
  @override
  void initState() {
    super.initState();
    if (widget.id != null) {
      context.read<SongBloc>().add(
        SongEvent.filterSongByArtist(id: widget.id!),
      );
    } else {
      context.read<SongBloc>().add(SongEvent.loadSongs());
    }
  }

  @override
  Widget build(BuildContext context) {
    return const _SongsView();
  }
}

class _SongsView extends StatelessWidget {
  const _SongsView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: BlocBuilder<SongBloc, SongState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => SongsList(songs: []),
            error: (msg) =>
                Center(child: Text(msg, style: StylesConstants.hintGrey12w400)),
            loaded: (songs) {
              return SongsList(songs: songs);
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
