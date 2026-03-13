import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';
import 'package:artist_ums/features/users/presentation/screens/widgets/user_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersView extends StatelessWidget {
  const UsersView({super.key});

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const UsersList(users: []),
            error: (msg) => Center(child: Text(msg.message)),
            usersLoaded: (users) => UsersList(users: users),
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
