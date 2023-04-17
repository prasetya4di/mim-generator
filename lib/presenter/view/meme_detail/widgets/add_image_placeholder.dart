import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/image_logo.dart';

class AddImagePlaceholder extends StatelessWidget {
  final XFile? image;
  final double opacity;
  final Function(XFile?) onSelectImage;

  const AddImagePlaceholder(
      {super.key,
      required this.onSelectImage,
      this.image,
      required this.opacity});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        ImagePicker imagePicker = ImagePicker();
        XFile? pickedFile = await imagePicker.pickImage(
          source: ImageSource.gallery,
          maxWidth: 500,
          maxHeight: 500,
        );
        onSelectImage(pickedFile);
      },
      child: image == null
          ? Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: const BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                ),
                const Icon(Icons.add),
              ],
            )
          : ImageLogo(file: image!, opacity: opacity),
    );
  }
}
