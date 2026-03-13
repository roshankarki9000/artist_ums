import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/profile/presentation/bloc/profile_state.dart';
import 'package:artist_ums/features/profile/presentation/screens/widgets/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileBloc>().add(ProfileEvent.loadProfile());

    return GenericScaffold(
      body: BlocListener<ProfileBloc, ProfileState>(
        listener: (context, state) => state.maybeWhen(
          orElse: () => null,
          success: (message) =>
              context.read<AuthBloc>().add(AuthEvent.checkSession()),
        ),
        child: const ProfileTab(),
      ),
    );
  }
}
