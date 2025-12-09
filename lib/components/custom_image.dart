import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sky_cast/core/config/app_colors.dart';

class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;

  const CustomImage({
    super.key,
    required this.imageUrl,
    this.width = 30,
    this.height = 30,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      width: width,
      height: height,
      imageUrl: imageUrl,
      errorWidget: (context, url, error) =>
          const Icon(Icons.cloud, size: 120, color: AppColors.darkBlue),
    );
  }
}
