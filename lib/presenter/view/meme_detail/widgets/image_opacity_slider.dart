import 'package:flutter/material.dart';

class ImageOpacitySlider extends StatelessWidget {
  final double opacity;
  final Function(double) onChange;

  const ImageOpacitySlider(
      {super.key, required this.onChange, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Opacity"),
                Text(opacity.toStringAsFixed(2))
              ],
            ),
          ),
          Slider(
            value: opacity,
            onChanged: onChange,
          )
        ],
      ),
    );
  }
}
