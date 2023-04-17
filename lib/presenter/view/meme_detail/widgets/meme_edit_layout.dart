import 'package:flutter/material.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/add_logo_field.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/draggable_logo.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_draggable_caption.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_image.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/new_caption_field.dart';

class MemeEditLayout extends StatefulWidget {
  final Meme meme;

  const MemeEditLayout({super.key, required this.meme});

  @override
  State<MemeEditLayout> createState() => _MemeEditLayout();
}

class _MemeEditLayout extends State<MemeEditLayout> {
  List<Widget> memeWidget = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            MemeImage(imageUrl: widget.meme.url ?? ""),
            ...memeWidget,
          ],
        ),
        const SizedBox(height: 8),
        NewCaptionField(
          onSubmit: (caption, color) {
            setState(() {
              memeWidget.add(
                  MemeDraggableCaption(caption: caption, textColor: color));
            });
          },
        ),
        const SizedBox(height: 8),
        AddLogoField(onAddLogo: (image, opacity) {
          setState(() {
            memeWidget.add(DraggableLogo(file: image, opacity: opacity));
          });
        })
      ],
    );
  }
}
