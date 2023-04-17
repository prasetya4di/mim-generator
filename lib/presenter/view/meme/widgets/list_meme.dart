import 'package:flutter/cupertino.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/presenter/view/meme/widgets/meme_item.dart';

class ListMeme extends StatelessWidget {
  final List<Meme> _memes;

  const ListMeme(this._memes, {super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 1,
          crossAxisCount: 3,
        ),
        itemCount: _memes.length,
        itemBuilder: (context, index) {
          Meme meme = _memes[index];

          return MemeItem(meme);
        });
  }
}
