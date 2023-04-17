import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mim_generator/generated/assets.dart';

class LoadingSaveMeme extends StatelessWidget {
  const LoadingSaveMeme({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          children: [
            SvgPicture.asset(Assets.imagesSaveImageIllustration, width: 250),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
            const SizedBox(height: 16),
            Text(
              "Saving image, please wait ...",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
