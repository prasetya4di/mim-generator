import 'package:flutter/material.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/button_add.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/caption_color_picker.dart';

class NewCaptionField extends StatefulWidget {
  final Function(String, Color) onSubmit;

  const NewCaptionField({super.key, required this.onSubmit});

  @override
  State<NewCaptionField> createState() => _NewCaptionField();
}

class _NewCaptionField extends State<NewCaptionField> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _controller = TextEditingController();

  Color _captionColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Add text"),
          const SizedBox(height: 6),
          Row(
            children: [
              CaptionColorPicker(
                onSelect: (color) {
                  setState(() {
                    _captionColor = color;
                  });
                },
                selectedColor: _captionColor,
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  focusNode: _focusNode,
                  controller: _controller,
                  onChanged: (_) {
                    setState(() {});
                  },
                ),
              ),
              const SizedBox(width: 6),
              ButtonAdd(
                onTap: _controller.value.text.isEmpty
                    ? null
                    : () {
                        _focusNode.unfocus();
                        widget.onSubmit(_controller.value.text, _captionColor);
                        resetValue();
                      },
              ),
            ],
          )
        ],
      ),
    );
  }

  resetValue() {
    setState(() {
      _controller.clear();
      _captionColor = Colors.black;
    });
  }
}
