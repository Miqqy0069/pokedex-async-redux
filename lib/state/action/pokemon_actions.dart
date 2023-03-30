import 'dart:async';
import 'package:async_redux/async_redux.dart';
import 'package:dartx/dartx.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/state/action/actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

/// Getting of pokemons from pokemon api
class GetPokemonsAction extends LoadingAction {
  static const key = 'get-pokemons-action';

  GetPokemonsAction() : super(actionKey: key);

  @override
  Future<AppState> reduce() async {
    final pokemons = await ApiService().pokemonApi.getPokemonList(offset: offset, limit: limit);

    return state.copyWith(pokemons: pokemons);
  }
}

/// Getting the pokemon Details from pokemon api
class GetPokemonDetailsAction extends LoadingAction {
  static const key = 'get-pokemon-details-action';

  GetPokemonDetailsAction({required this.pokemonName}) : super(actionKey: key);

  final String pokemonName;

  @override
  Future<AppState> reduce() async {
    final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(name: pokemonName);

    return state.copyWith(pokemonDetails: pokemonDetails);
  }
}

///  Searching Pokemon Action
class SearchPokemonsAction extends ReduxAction<AppState> {
  SearchPokemonsAction({required this.searchInput});

  final String searchInput;

  @override
  AppState reduce() {
    final currentPokemons = state.pokemons;

    List<Pokemon> searchedPokemons =
        currentPokemons.filter((pokemon) => pokemon.name.contains(searchInput.toLowerCase())).toList();
    return state.copyWith(searchedPokemons: searchedPokemons);
  }
}

/// Disposes the state of the PokemonDetailsPage if the user goes back to the overview page
class ClearPokemonDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(pokemonDetails: null);
}

/// Clears the Searched Pokemon
class ClearSearchedPokemonsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() => state.copyWith(searchedPokemons: List.empty());
}
