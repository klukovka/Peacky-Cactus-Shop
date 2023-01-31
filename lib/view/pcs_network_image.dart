import 'package:flutter/material.dart';
import 'package:peacky_cactus_shop/view/pcs_loader.dart';

class PcsNetworkImage extends StatelessWidget {
  final String? imageUrl;
  final Alignment alignment;
  final BoxFit fit;
  final double? width;
  final double? height;
  final double? loadingIndicatorSize;

  const PcsNetworkImage({
    Key? key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.alignment = Alignment.center,
    this.width,
    this.height,
    this.loadingIndicatorSize,
  }) : super(key: key);

  double? _getCorrectSize(double value) {
    if (value.isNaN || value.isInfinite) {
      return null;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final imageUrl = this.imageUrl;
    if (imageUrl == null || imageUrl.isEmpty) {
      return _buildErrorImage(context);
    }
    return LayoutBuilder(
      builder: (context, constraints) {
        final height = this.height ?? constraints.maxHeight;
        final width = this.width ?? constraints.maxWidth;
        return Image.network(
          imageUrl,
          fit: fit,
          height: _getCorrectSize(height),
          width: _getCorrectSize(width),
          alignment: alignment,
          loadingBuilder: (_, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return SizedBox(
              height: _getCorrectSize(height),
              child: Center(
                child: PcsLoader(
                  size: loadingIndicatorSize,
                ),
              ),
            );
          },
          errorBuilder: (_, __, ___) => _buildErrorImage(
            context,
            height: _getCorrectSize(height),
            width: _getCorrectSize(width),
          ),
        );
      },
    );
  }

  Widget _buildErrorImage(
    BuildContext context, {
    double? height,
    double? width,
  }) {
    const size = 64.0;
    return SizedBox(
      height: height ?? size,
      width: width ?? size,
      child: Align(
        alignment: Alignment.center,
        child: Icon(
          Icons.error,
          size: size,
          color: Theme.of(context).colorScheme.error,
        ),
      ),
    );
  }
}
