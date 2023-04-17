import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/add_image_placeholder.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/button_add.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/image_opacity_slider.dart';

class AddLogoField extends StatefulWidget {
  final Function(XFile, double) onAddLogo;

  const AddLogoField({super.key, required this.onAddLogo});

  @override
  State<AddLogoField> createState() => _AddLogoField();
}

class _AddLogoField extends State<AddLogoField> {
  XFile? selectedImage;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Add Logo"),
          const SizedBox(height: 8),
          Row(
            children: [
              AddImagePlaceholder(
                image: selectedImage,
                opacity: _opacity,
                onSelectImage: (file) {
                  setState(() {
                    selectedImage = file;
                  });
                },
              ),
              ImageOpacitySlider(
                onChange: (opacity) {
                  setState(() {
                    _opacity = opacity;
                  });
                },
                opacity: _opacity,
              ),
              ButtonAdd(
                onTap: selectedImage == null
                    ? null
                    : () {
                        widget.onAddLogo(selectedImage!, _opacity);
                      },
              )
            ],
          ),
        ],
      ),
    );
  }
}
