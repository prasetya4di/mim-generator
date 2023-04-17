import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/data/entity/meme.dart';
import 'package:mim_generator/domain/get_meme.dart';
import 'package:mim_generator/presenter/view/meme/bloc/meme_state.dart';

class MemeBloc extends Bloc<MemeEvent, MemeState> {
  final GetMeme _getMeme;

  List<Meme> _memes = [];

  List<Meme> get memes => _memes;

  MemeBloc(this._getMeme) : super(const MemeState.initial()) {
    on<MemeEvent>((event, emit) async {
      await event.when(
        loadMeme: () async {
          await Task(() async {
            emit(const MemeState.loading());
            return _getMeme();
          }).run().then((value) {
            value.fold(
              (l) {
                emit(MemeState.error(l.toString()));
              },
              (r) {
                if (r.isEmpty) {
                  emit(const MemeState.emptyMemeState());
                } else {
                  _memes = r;
                  emit(const MemeState.loadedState());
                }
              },
            );
          }).catchError((error) {
            emit(MemeState.error(error.toString()));
          });
        },
        refreshMeme: () async {
          await Task(() async {
            emit(const MemeState.refresh());
            return _getMeme();
          }).run().then((value) {
            value.fold(
              (l) {
                emit(MemeState.error(l.toString()));
              },
              (r) {
                if (r.isEmpty) {
                  emit(const MemeState.emptyMemeState());
                } else {
                  _memes = r;
                  emit(const MemeState.loadedState());
                }
              },
            );
          }).catchError((error) {
            emit(MemeState.error(error.toString()));
          });
        },
      );
    });
  }
}
