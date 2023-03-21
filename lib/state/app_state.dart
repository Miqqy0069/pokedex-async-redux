import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default(emptyString) String sample,
  }) = _AppState;


  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
