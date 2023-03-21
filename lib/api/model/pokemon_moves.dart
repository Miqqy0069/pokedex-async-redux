import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/moves_info.dart';

part 'pokemon_moves.freezed.dart';

part 'pokemon_moves.g.dart';

@freezed
class PokemonMoves with _$PokemonMoves {
  const factory PokemonMoves({
    @JsonKey(name: 'move') required MovesInfo move,
  }) = _PokemonMoves;

  factory PokemonMoves.fromJson(Map<String, dynamic> json) => _$PokemonMovesFromJson(json);
}
