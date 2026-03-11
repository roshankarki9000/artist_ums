import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_text_field.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _register(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.register(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            unauthenticated: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Account created successfully")),
              );

              context.go('/login');
            },
            authenticated: (_) => context.go('/dashboard'),
            error: (failure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(failure.message)));
            },
          );
        },
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 420),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),

                      /// Title
                      Text(
                        "Sign Up",
                        style: Theme.of(context).textTheme.headlineMedium
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),

                      SizedBox(height: 40.h),

                      /// Name
                      GenericTextField(
                        controller: _nameController,
                        hint: "Full Name",
                        icon: Icons.person_outline,
                        validator: (v) => v!.isEmpty ? "Enter your name" : null,
                      ),

                      SizedBox(height: 16.h),

                      /// Email
                      GenericTextField(
                        controller: _emailController,
                        hint: "Phone/Email Id",
                        icon: Icons.email_outlined,
                        validator: (v) => v!.isEmpty ? "Enter email" : null,
                      ),

                      SizedBox(height: 16.h),

                      /// Password
                      GenericTextField(
                        controller: _passwordController,
                        hint: "Password",
                        icon: Icons.lock_outline,
                        isPassword: true,
                        validator: (v) => v!.length < 6
                            ? "Password must be 6+ characters"
                            : null,
                      ),

                      SizedBox(height: 24.h),

                      /// Register Button
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          final isLoading = state.maybeWhen(
                            orElse: () => false,
                            loading: () => true,
                          );

                          return SizedBox(
                            width: double.infinity,
                            height: 55.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorConstant.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: isLoading
                                  ? null
                                  : () => _register(context),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                  : const Text("Create Account"),
                            ),
                          );
                        },
                      ),

                      SizedBox(height: 30.h),

                      /// Divider
                      Row(
                        children: [
                          const Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: const Text("OR"),
                          ),
                          const Expanded(child: Divider()),
                        ],
                      ),

                      SizedBox(height: 25.h),

                      /// Social login buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _socialButton(Icons.close),
                          SizedBox(width: 20.w),
                          _socialButton(Icons.facebook),
                          SizedBox(width: 20.w),
                          _socialButton(Icons.g_mobiledata),
                        ],
                      ),

                      SizedBox(height: 30.h),

                      /// Login link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Joined us before? "),
                          GestureDetector(
                            onTap: () => context.go('/login'),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                color: ColorConstant.primaryColor,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _socialButton(IconData icon) {
    return CircleAvatar(
      radius: 24,
      backgroundColor: Colors.white,
      child: Icon(icon),
    );
  }
}
