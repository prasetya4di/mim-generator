import 'package:flutter/material.dart';
import 'package:mim_generator/data/entity/meme.dart';

class MemeDetailPage extends StatelessWidget {
  final Meme meme;

  const MemeDetailPage({super.key, required this.meme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meme.name ?? ""),
      ),
      body: Text("Woww"),
    );
  }
}
