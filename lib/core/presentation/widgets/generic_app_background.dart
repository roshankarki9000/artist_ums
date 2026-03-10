import 'dart:ui';
import 'package:artist_ums/core/presentation/widgets/generic_safe_area.dart';
import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;

  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              left: -120,
              top: -120,
              child: _BlurBlob(
                size: 240,
                color: const Color(0xFF4527A0).withAlpha(80),
              ),
            ),

            Positioned(
              right: -140,
              bottom: -120,
              child: _BlurBlob(
                size: 240,
                color: const Color(0xFF4527A0).withAlpha(80),
              ),
            ),
            GenericSafeArea(child: child),
          ],
        ),
      ),
    );
  }
}

class _BlurBlob extends StatelessWidget {
  final double size;
  final Color color;

  const _BlurBlob({required this.size, required this.color});

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
      imageFilter: ImageFilter.blur(sigmaX: 107, sigmaY: 107),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
