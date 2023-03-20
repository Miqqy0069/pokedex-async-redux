import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

part 'pokemon.freezed.dart';

part 'pokemon.g.dart';

@freezed
class Pokemon with _$Pokemon{
  factory Pokemon({
     @JsonKey(name: jsonKeyName) required String name,
     @JsonKey(name: jsonKeyUrl) required String url,
  }) = _Pokemon;

  factory Pokemon.fromJson(Map<String, dynamic> json) => _$PokemonFromJson(json);
}