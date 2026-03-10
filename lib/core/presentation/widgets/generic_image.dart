import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class GenericImage {
  static Image asset(
    String assetName, {
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Clip clipBehavior = Clip.hardEdge,
    AlignmentGeometry alignment = Alignment.center,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  }) {
    assert(
      assetName.endsWith('png') ||
          assetName.endsWith('jpg') ||
          assetName.endsWith('jpeg') ||
          assetName.endsWith('gif') ||
          assetName.endsWith('webp'),
      'Image extension not supported',
    );

    return Image.asset(
      assetName,
      height: height,
      width: width,
      alignment: alignment,
      color: color,
      fit: fit,
    );
  }

  static LottieBuilder lottieAsset(
    String assetName, {
    AnimationController? controller,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Clip clipBehavior = Clip.hardEdge,
    AlignmentGeometry alignment = Alignment.center,
    bool? repeat,
    void Function(LottieComposition)? onLoaded,
  }) {
    assert(assetName.endsWith('.json'), 'Lottie asset must be a .json file');

    return Lottie.asset(
      assetName,
      controller: controller,
      width: width,
      height: height,
      fit: fit,
      repeat: repeat,

      alignment: alignment,
      delegates: color != null
          ? LottieDelegates(
              values: [
                ValueDelegate.color(const ['**'], value: color),
              ],
            )
          : null,
      onLoaded: onLoaded,
    );
  }

  static SvgPicture svg(
    String assetName, {
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Alignment alignment = Alignment.center,
    Widget Function(BuildContext, Object, StackTrace)? errorBuilder,
    String? semanticsLabel,
  }) {
    assert(assetName.endsWith('svg'), 'SVG extension not supported');
    String localAsset = assetName;
    return SvgPicture.asset(
      localAsset,
      width: width,
      height: height,
      colorFilter: color != null
          ? ColorFilter.mode(color, BlendMode.srcIn)
          : null,
      fit: fit,
      alignment: alignment,
      semanticsLabel: semanticsLabel,
      errorBuilder: (context, error, stackTrace) =>
          errorBuilder?.call(context, error, stackTrace) ?? SizedBox.shrink(),
    );
  }
}
