import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/connectivity_bloc.dart';
import '../bloc/connectivity_state.dart';
import 'widgets/no_internet_lottie.dart';

class ConnectivityWidget extends StatelessWidget {
  final Widget child;
  const ConnectivityWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    const fadeAnimationDuration = Duration(milliseconds: 500);
    const slideAnimationDuration = Duration(milliseconds: 350);

    return Stack(
      children: [
        // MAIN UI
        child,

        // OFFLINE OVERLAY
        BlocBuilder<ConnectivityBloc, ConnectivityState>(
          builder: (context, state) {
            final isDisconnected = state.maybeWhen(
              disconnected: () => true,
              orElse: () => false,
            );

            return IgnorePointer(
              ignoring: !isDisconnected,
              child: Stack(
                children: [
                  // Dim background fade separately
                  AnimatedOpacity(
                    duration: fadeAnimationDuration,
                    curve: Curves.easeInOut,
                    opacity: isDisconnected ? 0.5 : 0,
                    child: Container(color: Colors.black),
                  ),

                  // Lottie overlay
                  Center(
                    child: AnimatedSlide(
                      offset: isDisconnected
                          ? Offset.zero
                          : const Offset(0, 0.1),
                      duration: slideAnimationDuration,
                      curve: Curves.easeInOut,
                      child: AnimatedOpacity(
                        opacity: isDisconnected ? 1 : 0,
                        duration: slideAnimationDuration,
                        curve: Curves.easeInOut,
                        child: const _OverlayContent(),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class _OverlayContent extends StatelessWidget {
  const _OverlayContent();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: false,
      child: Center(child: NoInternetLottie()),
    );
  }
}
