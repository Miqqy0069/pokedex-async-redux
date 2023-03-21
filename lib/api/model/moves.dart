import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/moves_info.dart';

part 'moves.freezed.dart';

part 'moves.g.dart';

@freezed
class Moves with _$Moves {
  const factory Moves({
    @JsonKey(name: 'move') required MovesInfo move,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
