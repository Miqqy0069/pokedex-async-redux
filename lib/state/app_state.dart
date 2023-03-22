import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';

part 'app_state.freezed.dart';

part 'app_state.g.dart';

@freezed
class AppState with _$AppState {
  factory AppState({
    @Default('') String sample,
    @Default(<Pokemon>[]) List<Pokemon> pokemons,
    @Default(PokemonDetails(height: 0, weight: 0, baseExperience: 0, abilities: [], moves: [], stats: []))
        PokemonDetails pokemonDetails,
  }) = _AppState;

  factory AppState.fromJson(Map<String, dynamic> json) => _$AppStateFromJson(json);
}
