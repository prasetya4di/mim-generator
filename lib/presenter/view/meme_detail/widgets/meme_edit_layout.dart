import 'package:flutter/material.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_draggable_caption.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_image.dart';

class MemeEditLayout extends StatefulWidget {
  final Meme meme;

  const MemeEditLayout({super.key, required this.meme});

  @override
  State<MemeEditLayout> createState() => _MemeEditLayout();
}

class _MemeEditLayout extends State<MemeEditLayout> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        MemeImage(imageUrl: widget.meme.url ?? ""),
        const MemeDraggableCaption(
          caption: "One doesn't \n simply hahaha",
          textColor: Colors.black,
        )
      ],
    );
  }
}
