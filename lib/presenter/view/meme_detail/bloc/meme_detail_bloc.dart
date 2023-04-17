import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mim_generator/data/entity/edited_meme.dart';
import 'package:mim_generator/domain/get_edited_meme.dart';
import 'package:mim_generator/domain/save_meme_image.dart';
import 'package:mim_generator/presenter/view/meme_detail/bloc/meme_detail_state.dart';

class MemeDetailBloc extends Bloc<MemeDetailEvent, MemeDetailState> {
  final GetEditedMeme _getEditedMeme;
  final SaveMemeImage _saveMemeImage;

  EditedMeme? _editedMeme;

  EditedMeme? get editedMeme => _editedMeme;

  MemeDetailBloc(this._getEditedMeme, this._saveMemeImage)
      : super(const MemeDetailState.initial()) {
    on<MemeDetailEvent>((event, emit) {
      event.when(
        loadEditedMeme: (serverId) {
          emit(const MemeDetailState.loading());
          _editedMeme = _getEditedMeme(serverId);
          emit(const MemeDetailState.loadedState());
        },
        saveEditedMeme: (imageBytes, serverId) async {
          emit(const MemeDetailState.loading());
          _editedMeme = await _saveMemeImage(imageBytes, serverId);
          emit(const MemeDetailLoadedState());
        },
      );
    });
  }
}
