import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

/// Getting of pokemons from pokemon api
class GetPokemonsAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: offset, limit: limit);

    return state.copyWith(pokemons: pokemons);
  }
}

/// Getting the pokemon Details from pokemon api
class GetPokemonDetailsAction extends ReduxAction<AppState> {
  GetPokemonDetailsAction({required this.pokemonName});

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}
