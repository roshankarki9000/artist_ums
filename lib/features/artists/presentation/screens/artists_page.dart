import 'package:artist_ums/features/artists/presentation/screens/widgets/artist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/artist_bloc.dart';
import '../bloc/artist_event.dart';

class ArtistsPage extends StatefulWidget {
  const ArtistsPage({super.key});

  @override
  State<ArtistsPage> createState() => _ArtistsPageState();
}

class _ArtistsPageState extends State<ArtistsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ArtistBloc>().add(ArtistEvent.loadArtists());
  }

  @override
  Widget build(BuildContext context) {
    return const ArtistsView();
  }
}
