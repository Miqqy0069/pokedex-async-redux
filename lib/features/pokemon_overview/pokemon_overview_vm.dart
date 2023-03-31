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
        searchedPokemons: _searchedPokemons(),
        onSearchPokemons: _onSearchPokemons,
        onClearSearchedPokemons: _clearSearchedPokemons,
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

  void _onSearchPokemons(searchInput) => dispatchSync(SearchPokemonsAction(searchInput: searchInput));

  void _clearSearchedPokemons() => dispatchSync(ClearSearchedPokemonsAction());

  List<Pokemon> _searchedPokemons() => state.searchedPokemons;
}

class PokemonOverviewVm<T> extends Vm {
  PokemonOverviewVm({
    required this.searchedPokemons,
    required this.onClearSearchedPokemons,
    required this.onSearchPokemons,
    required this.pokemons,
  }) : super(equals: [
          pokemons,
          searchedPokemons,
        ]);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback onClearSearchedPokemons;
  final ValueChanged<T> onSearchPokemons;
}
