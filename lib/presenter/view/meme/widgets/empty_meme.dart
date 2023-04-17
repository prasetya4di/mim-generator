import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mim_generator/generated/assets.dart';

class EmptyMeme extends StatelessWidget {
  const EmptyMeme({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(Assets.imagesEmptyMemeIllustration, width: 250),
            const SizedBox(height: 8),
            Text(
              "Oopss... Our meme is empty, please try again later",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
