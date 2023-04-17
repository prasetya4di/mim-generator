import 'package:flutter/material.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_caption.dart';

class MemeDraggableCaption extends StatefulWidget {
  final String caption;
  final Color textColor;

  const MemeDraggableCaption(
      {super.key, required this.caption, required this.textColor});

  @override
  State<MemeDraggableCaption> createState() => _MemeDraggableCaptionState();
}

class _MemeDraggableCaptionState extends State<MemeDraggableCaption> {
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
          child: MemeCaption(
            caption: widget.caption,
            textColor: widget.textColor,
          ),
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
        child: MemeCaption(
            caption: widget.caption,
            textColor: _dragging
                ? widget.textColor.withOpacity(0.5)
                : widget.textColor),
      ),
    );
  }
}
