import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(emptyString) String sample,
  }) = _AppState;

<<<<<<< HEAD
  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
=======
  factory AppState.fromJson(Map<String, dynamic> json) =>
      _$AppStateFromJson(json);
}
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
