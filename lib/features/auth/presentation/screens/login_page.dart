import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) => state.when(
          initial: () => _setLoading(false),
          loading: () => _setLoading(true),
          resetRequired: () => context.push('/reset-password'),
          authenticated: () => context.go('/dashboard'),
          unauthenticated: () => _setLoading(false),
          error: (failure) => _setError(failure.message),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 16),
              if (_errorMessage != null)
                Text(_errorMessage!, style: const TextStyle(color: Colors.red)),
              const SizedBox(height: 16),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _login,
                      child: const Text('Login'),
                    ),
              SizedBox(height: 8.h),
              ElevatedButton(
                onPressed: () =>
                    context.read<AuthBloc>().add(AuthEvent.loginWithGoogle()),
                child: const Text('Login'),
              ),
              SizedBox(height: 8.h),

              TextButton(
                onPressed: () => context.push('/register'),
                child: const Text('Create an account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    if (email.isNotEmpty && password.isNotEmpty) {
      context.read<AuthBloc>().add(
        AuthEvent.login(email: email, password: password),
      );
    }
  }

  void _setLoading(bool loading) {
    setState(() {
      _isLoading = loading;
      _errorMessage = null;
    });
  }

  void _setError(String message) {
    setState(() {
      _isLoading = false;
      _errorMessage = message;
    });
  }
}
