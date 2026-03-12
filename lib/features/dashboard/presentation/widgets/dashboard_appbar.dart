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

class DashboardAppBar extends StatelessWidget {
  final EdgeInsets contentPadding;
  const DashboardAppBar({
    super.key,
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 22),
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return state.maybeWhen(
          authenticated: (user) {
            return Padding(
              padding: EdgeInsets.only(top: kToolbarHeight),
              child: Padding(
                padding: contentPadding,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Glow(
                      child: Container(
                        height: 60.r,
                        width: 60.r,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Transform.scale(
                          scale: 1.5,
                          child: Center(
                            child: GenericImage.lottieAsset(
                              ImageConstants.avatarLogoLottie,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: user.name,
                            style: StylesConstants.textDark20w500,
                          ),
                          TextSpan(text: '\n'),
                          TextSpan(
                            text: user.role,
                            style: StylesConstants.textDark16w400,
                          ),
                        ],
                        style: TextStyle(height: 1),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<AuthBloc>().add(AuthEvent.logout());
                      },
                      icon: Icon(Icons.logout_rounded),
                    ),
                  ],
                ),
              ),
            );
          },
          orElse: () {
            return const Center(child: CupertinoActivityIndicator());
          },
        );
      },
    );
  }
}
