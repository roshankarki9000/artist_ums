import 'package:artist_ums/core/app_router/app_routes.dart';
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

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(
        AuthEvent.login(
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
            authenticated: (_) => DashboardRoute().go(context),
            resetRequired: () => ResetPasswordRoute().push(context),
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
              constraints: const BoxConstraints(maxWidth: 420),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 40.h),

                    Text(
                      "Sign In",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),

                    SizedBox(height: 40.h),

                    GenericTextField(
                      controller: _emailController,
                      hint: "Email Id",
                      icon: ImageConstants.userLogoLottie,
                      validator: (v) => v!.isEmpty ? "Enter email" : null,
                    ),

                    SizedBox(height: 16.h),

                    GenericTextField(
                      controller: _passwordController,
                      hint: "Password",
                      icon: ImageConstants.passwordLogoLottie,
                      isPassword: true,
                      validator: (v) => v!.isEmpty ? "Enter password" : null,
                    ),

                    SizedBox(height: 20.h),

                    BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        final isLoading = state.maybeWhen(
                          orElse: () => false,
                          loading: () => true,
                        );

                        return GenericElevatedButton(
                          title: 'Sign in',
                          onPressed: () => _login(context),
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
                          "New here? ",
                          style: StylesConstants.textDark14w400,
                        ),
                        GestureDetector(
                          onTap: () => RegisterRoute().push(context),
                          child: Text(
                            "Register",
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
