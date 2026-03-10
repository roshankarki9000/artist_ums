import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/constants/style_constants.dart';
import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:artist_ums/core/presentation/widgets/glow.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_event.dart';
import 'package:artist_ums/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        context.read<AuthBloc>().add(const AuthEvent.checkSession());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            authenticated: () => context.go('/dashboard'),
            unauthenticated: () => context.go('/login'),
            error: (failure) => context.go('/login'),
          );
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Glow(
                child: GenericImage.lottieAsset(
                  ImageConstants.cassetteLogoLottie,
                  controller: _controller,
                  width: 250.w,
                  height: 250.h,
                  onLoaded: (composition) {
                    _controller.duration = composition.duration;
                    _controller.forward();
                  },
                ),
              ),
              CupertinoActivityIndicator(),
              Center(
                child: FadeTransition(
                  opacity: _controller,
                  child: Text(
                    'Artist Management System',
                    style: StylesConstants.textDark24w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
