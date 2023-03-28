import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_page.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_vm.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/state/app_state.dart';

class PokemonDetailsConnector extends StatelessWidget {
  const PokemonDetailsConnector({super.key});

  static const routeName = '/pokemonDetails';

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as DetailsArguments;

    return StoreConnector<AppState, PokemonDetailsVm>(
      vm: () => PokemonDetailsVmFactory(),
      onInit: (store) => store.dispatchAsync(GetPokemonDetailsAction(pokemonName: args.pokemonName)),
      onDispose: (store) => store.dispatchSync(ClearPokemonDetailsAction()),
      builder: (_, vm) => PokemonDetailsPage(pokemonDetails: vm.pokemonDetails),
    );
  }
}

class DetailsArguments {
  DetailsArguments(this.pokemonName);
  final String pokemonName;
}
