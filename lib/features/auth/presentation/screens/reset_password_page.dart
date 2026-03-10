import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final controller = TextEditingController();

  bool loading = false;
  String? error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Reset Password")),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: () => context.go('/dashboard'),
            error: (f) => setState(() {
              loading = false;
              error = f.message;
            }),
            unauthenticated: () => context.go('/login'),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller,
                obscureText: true,
                decoration: const InputDecoration(labelText: "New Password"),
              ),
              const SizedBox(height: 20),

              if (error != null)
                Text(error!, style: const TextStyle(color: Colors.red)),

              ElevatedButton(
                onPressed: loading ? null : _reset,
                child: const Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _reset() {
    final password = controller.text.trim();

    context.read<AuthBloc>().add(AuthEvent.resetPassword(password: password));
  }
}
