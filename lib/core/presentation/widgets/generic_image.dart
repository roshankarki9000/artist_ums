import 'dart:io';

import 'package:artist_ums/core/api/auth_client.dart';
import 'package:artist_ums/core/constants/color_constants.dart';
import 'package:artist_ums/core/constants/image_constants.dart';
import 'package:artist_ums/core/utils/extensions/log_extension.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
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

  static Image file(
    File assetName, {
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Clip clipBehavior = Clip.hardEdge,
    AlignmentGeometry alignment = Alignment.center,
    Widget Function(BuildContext, Object, StackTrace?)? errorBuilder,
  }) {
    return Image.file(
      assetName,
      height: height,
      width: width,
      alignment: alignment,
      color: color,
      fit: fit,
      errorBuilder: errorBuilder,
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

  static Widget network(
    String url, {
    Object? heroTag,
    double? width,
    double? height,
    Color? color,
    BoxFit fit = BoxFit.contain,
    Clip clipBehavior = Clip.hardEdge,
    AlignmentGeometry alignment = Alignment.center,
    Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder,
    Widget Function(BuildContext, String, Object)? errorBuilder,
    bool showError = true,
  }) {
    return _CustomNetworkImage(
      url,
      width: width,
      fit: fit,
      height: height,
      heroTag: heroTag,
      imageBuilder: imageBuilder,
      errorWidget: errorBuilder,
      showError: showError,
    );
  }
}

class _CustomNetworkImage extends StatefulWidget {
  final String? url;

  final Widget Function(BuildContext, ImageProvider<Object>)? imageBuilder;

  const _CustomNetworkImage(
    this.url, {
    this.width,
    this.fit,
    this.showError = true,
    this.height,
    this.heroTag,
    this.imageBuilder,
    this.errorWidget,
  });

  final double? width;
  final double? height;
  final BoxFit? fit;
  final bool showError;

  final Object? heroTag;
  final Widget Function(BuildContext, String, Object)? errorWidget;

  @override
  State<_CustomNetworkImage> createState() => __CustomNetworkImageState();
}

class __CustomNetworkImageState extends State<_CustomNetworkImage> {
  late final ValueNotifier<Object?> _heroController;
  @override
  void initState() {
    super.initState();
    if (widget.heroTag is String?) {
      if ((widget.heroTag as String? ?? '').isEmpty) {
        _heroController = ValueNotifier(null);
      } else {
        _heroController = ValueNotifier(widget.heroTag);
      }
    } else {
      if (widget.heroTag == null) {
        _heroController = ValueNotifier(null);
      } else {
        _heroController = ValueNotifier(widget.heroTag);
      }
    }
  }

  @override
  void dispose() {
    _heroController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final url = widget.url;
    return _MayAddHero(
      heroController: _heroController,
      child: Builder(
        builder: (context) {
          if (url == null || url.isEmpty) {
            return _mayUseOnErrorEmpty(ImageConstants.noInternetLogoGif);
          }
          return CachedNetworkImage(
            errorListener: (value) => (
              value.toString(),
              name: 'Network image error log',
            ).logError(type: 'Cached network Image'),
            httpHeaders: _getHttpHeaders(),
            imageUrl: url,
            imageBuilder: widget.imageBuilder,
            progressIndicatorBuilder: (_, _, _) {
              return Container(
                height: widget.height,
                width: widget.width,
                decoration: BoxDecoration(
                  color: ColorConstant.disabledTextField,
                ),
                child: CupertinoActivityIndicator(
                  color: ColorConstant.primaryColor,
                ),
              );
            },
            errorWidget: widget.showError
                ? (_, __, ___) {
                    Future.delayed(Duration.zero, () {
                      _heroController.value = null;
                    });
                    return widget.errorWidget?.call(context, __, ___) ??
                        _mayUseOnErrorEmpty(ImageConstants.noInternetLogoGif);
                  }
                : (_, _, _) => const SizedBox(),
            fit: widget.fit,
            width: widget.width,
            height: widget.height,
          );
        },
      ),
    );
  }

  Map<String, String> _getHttpHeaders() {
    final token = GetIt.I<AuthClient>().session?.refreshToken;
    if (token?.isNotEmpty ?? false) {
      return {'Authorization': 'Bearer $token'};
    }
    return {};
  }

  Widget _mayUseOnErrorEmpty(String image) {
    return widget.errorWidget?.call(
          context,
          'Could not load image',
          'Could not load image',
        ) ??
        GenericImage.asset(
          image,
          fit: widget.fit ?? BoxFit.contain,
          width: widget.width,
          height: widget.height,
        );
  }
}

class _MayAddHero extends StatelessWidget {
  final ValueNotifier<Object?> heroController;
  final Widget child;

  const _MayAddHero({required this.heroController, required this.child});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: heroController,
      builder: (context, heroTag, _) {
        if (heroTag != null) {
          return Hero(tag: heroTag, child: child);
        } else {
          return child;
        }
      },
    );
  }
}
