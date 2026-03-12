import 'package:artist_ums/core/di/get_it_config/get_it.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<UserBloc>()..add(const UserEvent.getUsers()),
      child: const _UsersView(),
    );
  }
}

class _UsersView extends StatelessWidget {
  const _UsersView();

  @override
  Widget build(BuildContext context) {
    return GenericScaffold(
      appBar: AppBar(title: const Text("Users")),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (failure) => Center(child: Text(failure.message)),
            usersLoaded: (users) {
              return ListView.builder(
                itemCount: users.length,
                itemBuilder: (_, i) {
                  final user = users[i];

                  return ListTile(
                    title: Text(user.name),
                    subtitle: Text(user.email),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        context.read<UserBloc>().add(
                          UserEvent.deleteUser(id: user.id),
                        );
                      },
                    ),
                  );
                },
              );
            },
            orElse: () => SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
