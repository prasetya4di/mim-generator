import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/presenter/view/meme_detail/bloc/meme_detail_bloc.dart';
import 'package:mim_generator/presenter/view/meme_detail/bloc/meme_detail_state.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/edited_meme_widget.dart';
import 'package:mim_generator/presenter/view/meme_detail/widgets/meme_edit_layout.dart';

class MemeDetailPage extends StatelessWidget {
  final Meme meme;

  const MemeDetailPage({super.key, required this.meme});

  @override
  Widget build(BuildContext context) {
    MemeDetailBloc bloc = context.read();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      bloc.add(MemeDetailEvent.loadEditedMeme(meme.id ?? ""));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(meme.name ?? ""),
      ),
      body: SingleChildScrollView(
        child: BlocBuilder<MemeDetailBloc, MemeDetailState>(
            builder: (context, state) {
          if (bloc.editedMeme != null) {
            return EditedMemeWidget(editedMeme: bloc.editedMeme!);
          } else {
            return MemeEditLayout(meme: meme);
          }
        }),
      ),
    );
  }
}
