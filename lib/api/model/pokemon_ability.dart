import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/ability_info.dart';

part 'pokemon_ability.freezed.dart';

part 'pokemon_ability.g.dart';

@freezed
class PokemonAbility with _$PokemonAbility {
  const factory PokemonAbility({
    @JsonKey(name: 'ability') required AbilityInfo ability,
  }) = _PokemonAbility;

  factory PokemonAbility.fromJson(Map<String, dynamic> json) => _$PokemonAbilityFromJson(json);
}
