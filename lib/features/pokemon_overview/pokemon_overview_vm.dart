import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/pokemon_overview_connector.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonOverviewVmFactory extends VmFactory<AppState, PokemonOverviewConnector> {
  @override
  Vm fromStore() => PokemonOverviewVm(
        pokemons: _pokemons(),
        searchedPokemons: searchedPokemons(),
        getFilteredPokemons: (searchInput) => _getFilteredPokemons(searchInput),
        clearSearchedPokemons: _clearSearchedPokemons,
      );

  Async<List<Pokemon>> _pokemons() {
    if (state.wait.isWaitingFor(GetPokemonsAction.key)) return const Async.loading();
    if (state.pokemons.isEmpty) return const Async.error(errorMessage);

    return Async(state.pokemons);
  }

  Async<List<Pokemon>> searchedPokemons() {
    if (state.searchedPokemons.isEmpty) return const Async.error(searchErrorMessage);

    return Async(state.searchedPokemons);
  }

  void _getFilteredPokemons(String searchInput) => dispatchSync(SearchPokemonsAction(searchInput: searchInput));
  void _clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());
}

class PokemonOverviewVm extends Vm {
  PokemonOverviewVm({
    required this.searchedPokemons,
    required this.clearSearchedPokemons,
    required this.getFilteredPokemons,
    required this.pokemons,
  }) : super(equals: [pokemons, searchedPokemons]);

  final Async<List<Pokemon>> pokemons;
  final Async<List<Pokemon>> searchedPokemons;
  final VoidCallback clearSearchedPokemons;
  final Function(String) getFilteredPokemons;
}
