import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/presenter/view/meme_detail/bloc/meme_detail_bloc.dart';
import 'package:mim_generator/presenter/view/meme_detail/bloc/meme_detail_state.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/add_logo_field.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/draggable_caption.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/draggable_logo.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_image.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/new_caption_field.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/save_image_button.dart';
import 'package:widgets_to_image/widgets_to_image.dart';

class MemeEditLayout extends StatefulWidget {
  final Meme meme;

  const MemeEditLayout({super.key, required this.meme});

  @override
  State<MemeEditLayout> createState() => _MemeEditLayout();
}

class _MemeEditLayout extends State<MemeEditLayout> {
  List<Widget> memeWidget = [];
  WidgetsToImageController controller = WidgetsToImageController();
  late MemeDetailBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetsToImage(
          controller: controller,
          child: Stack(
            children: [
              MemeImage(imageUrl: widget.meme.url ?? ""),
              ...memeWidget,
            ],
          ),
        ),
        if (memeWidget.isNotEmpty)
          SaveImageButton(
            onTap: () async {
              Uint8List? bytes = await controller.capture();
              if (bytes != null) {
                bloc.add(MemeDetailEvent.saveEditedMeme(
                    bytes, widget.meme.id ?? ""));
              }
            },
          ),
        const SizedBox(height: 8),
        NewCaptionField(
          onSubmit: (caption, color) {
            setState(() {
              memeWidget
                  .add(DraggableCaption(caption: caption, textColor: color));
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
