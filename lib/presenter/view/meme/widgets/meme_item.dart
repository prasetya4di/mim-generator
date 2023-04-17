import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/util/constants/routes.dart';

class MemeItem extends StatelessWidget {
  final Meme _meme;

  const MemeItem(this._meme, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.memeDetail, arguments: _meme);
      },
      child: Center(
        child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: _meme.url ?? "",
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => const Icon(Icons.error)),
      ),
    );
  }
}
