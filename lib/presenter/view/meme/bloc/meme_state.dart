import 'package:freezed_annotation/freezed_annotation.dart';

part 'meme_state.freezed.dart';

@freezed
class MemeEvent with _$MemeEvent {
  const factory MemeEvent.loadMeme() = LoadMemeEvent;

  const factory MemeEvent.refreshMeme() = RefreshMemeEvent;
}

@freezed
abstract class MemeState with _$MemeState {
  const factory MemeState.initial() = MemeInitialState;

  const factory MemeState.loading() = MemeLoadingState;

  const factory MemeState.refresh() = MemeRefreshState;

  const factory MemeState.error(String message) = MemeErrorState;

  const factory MemeState.loadedState() = MemeLoadedState;
}
