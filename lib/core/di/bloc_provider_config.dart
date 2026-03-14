import 'package:artist_ums/core/di/get_it_config/get_it.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/bloc/connectivity_bloc.dart';
import 'package:artist_ums/core/presentation/widgets/connectivity/bloc/connectivity_event.dart';
import 'package:artist_ums/features/activity_logs/presentation/bloc/activity_log_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocProviderConfig extends StatelessWidget {
  final Widget child;
  const BlocProviderConfig({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) =>
              getIt<ConnectivityBloc>()..add(ConnectivityEvent.started()),
        ),
        BlocProvider.value(value: getIt<AuthBloc>()),
        BlocProvider(create: (_) => getIt<UserBloc>()),
        BlocProvider(create: (_) => getIt<ArtistBloc>()),
        BlocProvider(create: (_) => getIt<SongBloc>()),
        BlocProvider(create: (_) => getIt<ActivityLogBloc>()),
        BlocProvider(create: (_) => getIt<ProfileBloc>()),
      ],
      child: child,
    );
  }
}
