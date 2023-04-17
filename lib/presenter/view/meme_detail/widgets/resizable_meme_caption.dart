import 'package:flutter/material.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_caption.dart';

class ResizableMemeCaption extends StatefulWidget {
  final String caption;
  final Color textColor;

  const ResizableMemeCaption(
      {super.key, required this.caption, required this.textColor});

  @override
  State<ResizableMemeCaption> createState() => _ResizableMemeCaption();
}

class _ResizableMemeCaption extends State<ResizableMemeCaption> {
  double _height = 100;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _height += details.delta.dy;
        });
      },
      child: SizedBox(
        height: _height,
        child: MemeCaption(
          caption: widget.caption,
          textColor: widget.textColor,
        ),
      ),
    );
  }
}
