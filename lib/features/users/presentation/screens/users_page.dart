import 'package:artist_ums/features/users/presentation/screens/widgets/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(UserEvent.getUsers());
  }

  @override
  Widget build(BuildContext context) {
    return const UsersView();
  }
}
