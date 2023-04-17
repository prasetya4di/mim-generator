import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class NewCaptionField extends StatefulWidget {
  final Function(String, Color) onSubmit;

  const NewCaptionField({super.key, required this.onSubmit});

  @override
  State<NewCaptionField> createState() => _NewCaptionField();
}

class _NewCaptionField extends State<NewCaptionField> {
  String _newCaption = "";
  Color _captionColor = Colors.black;
  Color _pickerColor = Colors.black;

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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Select a caption color!'),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: _captionColor,
                            onColorChanged: (newColor) {
                              _pickerColor = newColor;
                            },
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text('Select'),
                            onPressed: () {
                              setState(() => _captionColor = _pickerColor);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  width: 96,
                  height: 48,
                  color: _captionColor,
                ),
              ),
              const SizedBox(width: 6),
              Flexible(
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _newCaption = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 6),
              TextButton(
                onPressed: _newCaption.isEmpty
                    ? null
                    : () {
                        widget.onSubmit(_newCaption, _captionColor);
                        resetValue();
                      },
                child: const Text("Add"),
              )
            ],
          )
        ],
      ),
    );
  }

  resetValue() {
    setState(() {
      _newCaption = "";
      _captionColor = Colors.black;
      _pickerColor = _captionColor;
    });
  }
}
