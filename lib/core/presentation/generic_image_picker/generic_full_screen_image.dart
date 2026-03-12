import 'dart:async';
import 'dart:typed_data';
import 'dart:io';

import 'package:artist_ums/core/presentation/widgets/generic_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FullScreenImageGallery {
  /// Opens a fullscreen image gallery with image paths
  static Future<void> openWithPaths(
    BuildContext context,
    List<String> imagePaths, {
    int initialIndex = 0,
    String? heroTag,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _FullScreenGalleryPage(
          imagePaths: imagePaths,
          initialIndex: initialIndex,
          heroTag: heroTag,
        ),
      ),
    );
  }

  /// Opens a fullscreen image gallery with image blobs (Uint8List)
  static Future<void> openWithBlobs(
    BuildContext context,
    List<Uint8List> imageBlobs, {
    int initialIndex = 0,
    String? heroTag,
  }) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => _FullScreenGalleryPage(
          imageBlobs: imageBlobs,
          initialIndex: initialIndex,
          heroTag: heroTag,
        ),
      ),
    );
  }

  /// Opens a fullscreen gallery for a single image path
  static Future<void> openSingleImagePath(
    BuildContext context,
    String imagePath, {
    String? heroTag,
  }) async {
    await openWithPaths(
      context,
      [imagePath],
      initialIndex: 0,
      heroTag: heroTag,
    );
  }

  /// Opens a fullscreen gallery for a single image blob
  static Future<void> openSingleImageBlob(
    BuildContext context,
    Uint8List imageBlob, {
    String? heroTag,
  }) async {
    await openWithBlobs(
      context,
      [imageBlob],
      initialIndex: 0,
      heroTag: heroTag,
    );
  }

  /// Opens fullscreen gallery with mixed content (auto-detects type)
  static Future<void> open(
    BuildContext context, {
    List<String>? imagePaths,
    List<Uint8List>? imageBlobs,
    int initialIndex = 0,
    String? heroTag,
  }) async {
    assert(
      imagePaths != null || imageBlobs != null,
      'Either imagePaths or imageBlobs must be provided',
    );

    if (imagePaths != null) {
      await openWithPaths(
        context,
        imagePaths,
        initialIndex: initialIndex,
        heroTag: heroTag,
      );
    } else if (imageBlobs != null) {
      await openWithBlobs(
        context,
        imageBlobs,
        initialIndex: initialIndex,
        heroTag: heroTag,
      );
    }
  }
}

///This one for Hero WIDGETS and redirection to FullScreenGallery and shows prevoew first
class ImagePreviewer extends StatelessWidget {
  final List<String>? imagePaths;
  final List<Uint8List>? imageBlobs;
  final int initialIndex;

  const ImagePreviewer({
    super.key,
    this.imagePaths,
    this.imageBlobs,
    this.initialIndex = 0,
  }) : assert(imagePaths != null || imageBlobs != null);

  @override
  Widget build(BuildContext context) {
    final tag =
        'hero-${imagePaths?.first ?? imageBlobs.hashCode}-$initialIndex';

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => _FullScreenGalleryPage(
              imagePaths: imagePaths,
              imageBlobs: imageBlobs,
              initialIndex: initialIndex,
              heroTag: tag,
            ),
          ),
        );
      },
      child: Hero(
        tag: tag,
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: _ZoomableImage(
            imagePath: imagePaths?[initialIndex],
            imageBlob: imageBlobs?[initialIndex],
            onTap: null,
            fitType: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

/// Helper class to directly open fullscreen image gallery

class _ZoomableImage extends StatefulWidget {
  final String? imagePath;
  final Uint8List? imageBlob;
  final VoidCallback? onTap;
  final BoxFit fitType;

  const _ZoomableImage({
    this.imagePath,
    this.imageBlob,
    this.onTap,
    this.fitType = BoxFit.cover,
  });

  @override
  State<_ZoomableImage> createState() => _ZoomableImageState();
}

class _ZoomableImageState extends State<_ZoomableImage>
    with SingleTickerProviderStateMixin {
  late final TransformationController _transformationController;
  late final AnimationController _animationController;
  Animation<Matrix4>? _animation;

  Offset _doubleTapPosition = Offset.zero;

  @override
  void initState() {
    super.initState();
    _transformationController = TransformationController();
    _animationController =
        AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 300),
        )..addListener(() {
          if (_animation != null) {
            _transformationController.value = _animation!.value;
          }
        });
  }

  @override
  void dispose() {
    _transformationController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void _toggleZoom() {
    final currentScale = _transformationController.value.getMaxScaleOnAxis();
    final bool zoomingIn = currentScale == 1.0;
    final double newScale = zoomingIn ? 2.5 : 1.0;

    final Matrix4 endMatrix = Matrix4.identity();

    if (zoomingIn) {
      final double dx = -_doubleTapPosition.dx * (newScale - 1);
      final double dy = -_doubleTapPosition.dy * (newScale - 1);
      endMatrix
        ..translateByDouble(dx, dy, 0, 1)
        ..scaleByDouble(newScale, newScale, 1, 1);
    } else {
      endMatrix.scaleByDouble(1.0, 1.0, 1.0, 1.0);
    }

    _animation =
        Matrix4Tween(
          begin: _transformationController.value,
          end: endMatrix,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    _animationController.forward(from: 0);
  }

  Widget _fallbackImage() {
    return Container(
      width: double.infinity,
      color: Colors.grey.shade300,
      alignment: Alignment.center,
      child: Text("Failed to load", style: TextStyle(fontSize: 14.sp)),
    );
  }

  Widget _buildImage() {
    if (widget.imageBlob != null) {
      return Image.memory(
        widget.imageBlob!,
        fit: widget.fitType,
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
      );
    } else if (widget.imagePath != null) {
      return GenericImage.file(
        File(widget.imagePath!),
        fit: widget.fitType,
        width: double.infinity,
        alignment: Alignment.topCenter,
        height: double.infinity,
        errorBuilder: (p0, p1, p2) => _fallbackImage(),
      );
    }
    return const Center(child: Text("No Image"));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onDoubleTapDown: (details) => _doubleTapPosition = details.localPosition,
      onDoubleTap: _toggleZoom,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return InteractiveViewer(
            transformationController: _transformationController,
            panEnabled: true,
            scaleEnabled: true,
            minScale: 1.0,
            maxScale: 4.0,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
                minHeight: constraints.maxHeight,
              ),
              child: _buildImage(),
            ),
          );
        },
      ),
    );
  }
}

class _FullScreenGalleryPage extends StatefulWidget {
  final List<String>? imagePaths;
  final List<Uint8List>? imageBlobs;
  final int initialIndex;
  final String? heroTag;

  const _FullScreenGalleryPage({
    this.imagePaths,
    this.imageBlobs,
    required this.initialIndex,
    this.heroTag,
  });

  @override
  State<_FullScreenGalleryPage> createState() => _FullScreenGalleryPageState();
}

class _FullScreenGalleryPageState extends State<_FullScreenGalleryPage> {
  late final PageController _pageController;
  late int _currentIndex;
  late bool _isBlob;
  bool _showThumbnails = true;
  Timer? _hideTimer;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    _isBlob = widget.imageBlobs != null;

    _startAutoHideTimer();
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoHideTimer() {
    _hideTimer?.cancel();
    _hideTimer = Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          _showThumbnails = false;
        });
      }
    });
  }

  void _toggleThumbnails() {
    setState(() {
      _showThumbnails = !_showThumbnails;
    });

    if (_showThumbnails) {
      _startAutoHideTimer();
    } else {
      _hideTimer?.cancel();
    }
  }

  void _onThumbnailTap(int index) {
    _pageController.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });

    _startAutoHideTimer();
  }

  Widget _buildThumbnail(int index) {
    final isSelected = index == _currentIndex;

    Widget image = _isBlob
        ? Image.memory(widget.imageBlobs![index], fit: BoxFit.cover)
        : GenericImage.file(File(widget.imagePaths![index]), fit: BoxFit.cover);

    return GestureDetector(
      onTap: () => _onThumbnailTap(index),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        width: 60,
        height: 60,
        child: ClipRRect(borderRadius: BorderRadius.circular(2), child: image),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = _isBlob
        ? widget.imageBlobs!.length
        : widget.imagePaths!.length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: total,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });

              if (!_showThumbnails) {
                setState(() {
                  _showThumbnails = true;
                });
              }
              _startAutoHideTimer();
            },
            itemBuilder: (context, index) {
              final imageWidget = _ZoomableImage(
                imagePath: _isBlob ? null : widget.imagePaths![index],
                imageBlob: _isBlob ? widget.imageBlobs![index] : null,
                onTap: _toggleThumbnails,
                fitType: BoxFit.contain,
              );

              final isInitial =
                  index == widget.initialIndex && widget.heroTag != null;

              return Center(
                child: isInitial
                    ? Hero(tag: widget.heroTag!, child: imageWidget)
                    : imageWidget,
              );
            },
          ),
          AnimatedOpacity(
            opacity: _showThumbnails ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: IgnorePointer(
              ignoring: !_showThumbnails,
              child: Container(
                // ignore: deprecated_member_use
                color: Colors.black.withOpacity(0.5),
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.all(8),
                  itemCount: total,
                  itemBuilder: (context, index) => _buildThumbnail(index),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
