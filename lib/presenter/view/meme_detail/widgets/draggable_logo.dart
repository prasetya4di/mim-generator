import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/image_logo.dart';

class DraggableLogo extends StatefulWidget {
  final XFile file;
  final double opacity;

  const DraggableLogo({super.key, required this.file, required this.opacity});

  @override
  State<DraggableLogo> createState() => _DraggableLogoState();
}

class _DraggableLogoState extends State<DraggableLogo> {
  bool _dragging = false;
  Offset _offset = const Offset(0.0, 0.0);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: Draggable(
        feedback: Material(
          color: Colors.transparent,
          child: ImageLogo(file: widget.file, opacity: widget.opacity),
        ),
        onDragStarted: () {
          setState(() {
            _dragging = true;
          });
        },
        onDragEnd: (details) {
          setState(() {
            _dragging = false;
            _offset = details.offset - const Offset(0, 70);
          });
        },
        child: ImageLogo(
            file: widget.file, opacity: _dragging ? 0.5 : widget.opacity),
      ),
    );
  }
}
