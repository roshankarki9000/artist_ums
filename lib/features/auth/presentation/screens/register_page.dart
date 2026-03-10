import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _loading = false;
  String? _error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Account')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.when(
            initial: () => _setLoading(false),
            loading: () => _setLoading(true),

            /// registration success → go back to login
            unauthenticated: () {
              _setLoading(false);
              context.go('/login');
            },

            authenticated: () => context.go('/dashboard'),

            resetRequired: () => context.go('/reset-password'),

            error: (failure) => _setError(failure.message),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),

              const SizedBox(height: 12),

              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),

              const SizedBox(height: 20),

              if (_error != null)
                Text(_error!, style: const TextStyle(color: Colors.red)),

              const SizedBox(height: 12),

              _loading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _register,
                      child: const Text("Create Account"),
                    ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () => context.go('/login'),
                child: const Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _register() {
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      setState(() {
        _error = "All fields are required";
      });
      return;
    }

    context.read<AuthBloc>().add(
      AuthEvent.register(name: name, email: email, password: password),
    );
  }

  void _setLoading(bool value) {
    setState(() {
      _loading = value;
      _error = null;
    });
  }

  void _setError(String message) {
    setState(() {
      _loading = false;
      _error = message;
    });
  }
}
