import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/ability.dart';
import 'package:pokedex_async_redux/api/model/moves.dart';
import 'package:pokedex_async_redux/api/model/stats.dart';


part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  const factory PokemonDetails({
     @JsonKey(name: 'height') required double height,
     @JsonKey(name: 'weight') required double weight,
     @JsonKey(name: 'base_experience') required double baseExperience,
     @JsonKey(name: 'abilities') required List<Ability> abilities,
     @JsonKey(name: 'moves') required List<Moves> moves,
    @JsonKey(name: 'stats') required List<Stats> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}
