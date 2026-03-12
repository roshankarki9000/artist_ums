import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_elevated_button.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/widgets/generic_scaffold.dart';
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
    return GenericScaffold(
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
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 420.w),
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
                      icon: ImageConstants.userNoddingLogoLottie,
                      validator: (v) => v!.isEmpty ? "Enter your name" : null,
                    ),

                    SizedBox(height: 16.h),

                    /// Email
                    GenericTextField(
                      controller: _emailController,
                      hint: "Email Id",
                      icon: ImageConstants.userLogoLottie,
                      validator: (v) => v!.isEmpty ? "Enter email" : null,
                    ),

                    SizedBox(height: 16.h),

                    /// Password
                    GenericTextField(
                      controller: _passwordController,
                      hint: "Password",
                      icon: ImageConstants.passwordLogoLottie,
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
                        return GenericElevatedButton(
                          title: 'Create Account',
                          onPressed: () => _register(context),
                          loading: isLoading,
                        );
                      },
                    ),
                    SizedBox(height: 30.h),

                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Text(
                            "OR",
                            style: StylesConstants.textDark16w500,
                          ),
                        ),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(height: 25.h),

                    /// Social login buttons
                    GenericElevatedButton.circular(
                      backgroundColor: ColorConstant.whiteColor,
                      splashColor: ColorConstant.lightPinkColor,
                      icon: GenericImage.asset(ImageConstants.googleLogoGif),
                      onPressed: () {
                        context.read<AuthBloc>().add(
                          AuthEvent.loginWithGoogle(),
                        );
                      },
                    ),

                    SizedBox(height: 30.h),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Joined us before? ",
                          style: StylesConstants.textDark14w400,
                        ),
                        GestureDetector(
                          onTap: () => context.push('/login'),
                          child: Text(
                            "Log In",
                            style: StylesConstants.textPrimary14w500,
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
    );
  }
}
