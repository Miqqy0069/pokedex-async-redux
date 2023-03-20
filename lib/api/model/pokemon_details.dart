import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_details.freezed.dart';

part 'pokemon_details.g.dart';

@freezed
class PokemonDetails with _$PokemonDetails {
  const factory PokemonDetails({
    @Default(0) @JsonKey(name: 'height')  double height,
    @Default(0) @JsonKey(name: 'weight')  double weight,
    @Default(0) @JsonKey(name: 'base_experience')  double baseExperience,
    @Default([]) @JsonKey(name: 'abilities')  List<Map> abilities,
    @Default([]) @JsonKey(name: 'moves')  List<Map> moves,
    @Default([]) @JsonKey(name: 'stats')  List<Map> stats,
  }) = _PokemonDetails;

  factory PokemonDetails.fromJson(Map<String, dynamic> json) => _$PokemonDetailsFromJson(json);
}