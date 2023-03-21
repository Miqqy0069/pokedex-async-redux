import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/moves_info.dart';

part 'pokemon_moves.freezed.dart';

part 'pokemon_moves.g.dart';

@freezed
class Moves with _$PokemonMoves {
  const factory Moves({
    @JsonKey(name: 'move') required MovesInfo move,
  }) = _Moves;

  factory Moves.fromJson(Map<String, dynamic> json) => _$MovesFromJson(json);
}
