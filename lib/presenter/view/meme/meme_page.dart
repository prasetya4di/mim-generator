import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/presenter/view/meme/bloc/meme_bloc.dart';
import 'package:mim_generator/presenter/view/meme/bloc/meme_state.dart';
import 'package:mim_generator/presenter/view/meme/widgets/empty_meme.dart';
import 'package:mim_generator/presenter/view/meme/widgets/list_meme.dart';

class MemePage extends StatelessWidget {
  const MemePage({super.key});

  @override
  Widget build(BuildContext context) {
    MemeBloc bloc = context.read();

    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      bloc.add(const MemeEvent.loadMeme());
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Mim Generator"),
      ),
      body: BlocBuilder<MemeBloc, MemeState>(
        builder: (context, state) {
          if (state is EmptyMemeState) {
            return const EmptyMeme();
          } else {
            return ListMeme(bloc.memes);
          }
        },
      ),
    );
  }
}
