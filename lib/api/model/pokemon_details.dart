import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon_ability.dart';
import 'package:pokedex_async_redux/api/model/pokemon_moves.dart';
import 'package:pokedex_async_redux/api/model/pokemon_stats.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  const factory PokemonDetails({
    @Default(0) @JsonKey(name: 'height') double height,
    @Default(0) @JsonKey(name: 'weight') double weight,
    @Default(0) @JsonKey(name: 'base_experience') double baseExperience,
    @Default([]) @JsonKey(name: 'abilities') List<PokemonAbility> abilities,
    @Default([]) @JsonKey(name: 'moves') List<PokemonMoves> moves,
    @Default([]) @JsonKey(name: 'stats') List<PokemonStats> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
