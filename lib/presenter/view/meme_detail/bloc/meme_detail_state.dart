import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_detail_state.freezed.dart';

@freezed
class MemeDetailEvent with _$MemeDetailEvent {
  const factory MemeDetailEvent.loadEditedMeme(String serverId) =
      LoadEditedMemeEvent;

  const factory MemeDetailEvent.saveEditedMeme(
      Uint8List imageBytes, String serverId) = SaveEditedMemeEvent;
}

@freezed
abstract class MemeDetailState with _$MemeDetailState {
  const factory MemeDetailState.initial() = MemeDetailInitialState;

  const factory MemeDetailState.loading() = MemeDetailLoadingState;

  const factory MemeDetailState.error(String message) = MemeDetailErrorState;

  const factory MemeDetailState.loadedState() = MemeDetailLoadedState;

  const factory MemeDetailState.savedState() = MemeDetailSavedState;
}
