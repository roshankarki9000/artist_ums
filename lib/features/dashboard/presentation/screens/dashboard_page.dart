import 'package:artist_ums/core/di/get_it_config/get_it.dart';
import 'package:artist_ums/core/service/email_service.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_bloc.dart';
import 'package:artist_ums/features/users/presentation/bloc/user_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) => state.maybeWhen(
        orElse: () => null,
        unauthenticated: () => context.go('/login'),
      ),
      child: Scaffold(
        body: Column(
          spacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                context.read<AuthBloc>().add(AuthEvent.logout());
              },
              child: Text('Logout'),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UserBloc>().add(
                  UserEvent.createUser(
                    name: 'Roshan676',
                    email: 'roshankarki676@gmail.com',
                  ),
                );
              },
              child: Text('Create User'),
            ),

            ElevatedButton(
              onPressed: () {
                getIt<EmailService>().sendUserCreatedEmail(
                  'roshankarki9000@gmail.com',
                );
              },
              child: Text('Send Email'),
            ),
          ],
        ),
      ),
    );
  }
}
