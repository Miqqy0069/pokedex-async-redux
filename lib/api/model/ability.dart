import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/ability_info.dart';

part 'pokemon_ability.freezed.dart';

part 'pokemon_ability.g.dart';

@freezed
class Ability with _$PokemonAbility {
  const factory Ability({
    @JsonKey(name: 'ability') required AbilityInfo ability,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}
