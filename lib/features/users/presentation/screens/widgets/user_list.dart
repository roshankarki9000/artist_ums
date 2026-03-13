import 'package:artist_ums/features/users/domain/entities/user_model.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_state.dart';
import 'package:artist_ums/features/users/presentation/screens/widgets/user_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'user_tile.dart';
import 'add_user_tile.dart';

class UsersList extends StatelessWidget {
  final List<UserModel> users;

  const UsersList({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        UsersHeader(count: users.length),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          sliver: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              return state.maybeWhen(
                loading: () => const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                ),
                usersLoaded: (users) => SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    if (index == 0) return const AddUserTile();

                    final user = users[index - 1];
                    return UserTile(user: user);
                  }, childCount: users.length + 1),
                ),
                orElse: () => const SliverFillRemaining(
                  child: Center(child: Text('Could not load users')),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
