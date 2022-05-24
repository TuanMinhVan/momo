import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'shimmer.dart';

class CacheImage extends StatelessWidget {
  const CacheImage(
    this.imageUrl, {
    Key? key,
    this.onTap,
    this.width,
    this.height,
    this.radius = 0.0,
  }) : super(key: key);
  final double radius;
  final String? imageUrl;
  final VoidCallback? onTap;
  final double? width, height;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          height: height,
          width: width,
          imageUrl: imageUrl ?? 'https://i.stack.imgur.com/l60Hf.png',
          fit: BoxFit.cover,
          placeholder: (context, url) => Shimmer.fromColors(
            highlightColor: Colors.grey[100]!,
            baseColor: Colors.grey[300]!,
            child: Container(
              color: Colors.white,
              height: height ?? double.infinity,
              width: width ?? double.infinity,
            ),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
