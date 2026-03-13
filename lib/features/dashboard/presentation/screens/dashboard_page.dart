import 'package:artist_ums/core/app_router/app_routes.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_bloc.dart';
import 'package:artist_ums/features/artists/presentation/bloc/artist_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:artist_ums/features/dashboard/presentation/widgets/activities_log.dart';
import 'package:artist_ums/features/dashboard/presentation/widgets/custom_activity.dart';
import 'package:artist_ums/features/dashboard/presentation/widgets/custom_calender.dart';
import 'package:artist_ums/features/dashboard/presentation/widgets/dashboard_appbar.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_event.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_bloc.dart';
import 'package:artist_ums/features/songs/presentation/bloc/songs_event.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void didChangeDependencies() {
    _load();
    super.didChangeDependencies();
  }

  void _load() async {
    context.read<UserBloc>().add(UserEvent.getUsers());
    context.read<ArtistBloc>().add(ArtistEvent.loadArtists());
    context.read<SongBloc>().add(SongEvent.loadSongs());
    context.read<ProfileBloc>().add(ProfileEvent.loadProfile());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        unauthenticated: () => SplashRoute().go(context),
      ),
      child: GenericScaffold(
        enableDoubleTapExit: true,
        body: RefreshIndicator(
          onRefresh: () async => _load(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DashboardAppBar(),
                SizedBox(height: 20.h),
                CustomCalendar(),
                Activity(),
                SizedBox(height: 30.h),
                ActivitiesLog(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
