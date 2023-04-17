import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class CaptionColorPicker extends StatefulWidget {
  final Function(Color) onSelect;
  final Color selectedColor;

  const CaptionColorPicker(
      {super.key, required this.onSelect, required this.selectedColor});

  @override
  State<CaptionColorPicker> createState() => _CaptionColorPicker();
}

class _CaptionColorPicker extends State<CaptionColorPicker> {
  Color _pickerColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Select a caption color!'),
              content: SingleChildScrollView(
                child: ColorPicker(
                  pickerColor: widget.selectedColor,
                  onColorChanged: (newColor) {
                    _pickerColor = newColor;
                  },
                ),
              ),
              actions: <Widget>[
                ElevatedButton(
                  child: const Text('Select'),
                  onPressed: () {
                    widget.onSelect(_pickerColor);
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
        color: widget.selectedColor,
      ),
    );
  }
}
