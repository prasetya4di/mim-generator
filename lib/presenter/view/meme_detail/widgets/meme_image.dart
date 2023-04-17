import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MemeImage extends StatelessWidget {
  final String imageUrl;

  const MemeImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) => const Icon(Icons.error)),
    );
  }
}
