import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:pokedex_async_redux/api/api_service.dart';
import 'package:pokedex_async_redux/features/home_page.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

//TODO: Future to be removed.
Future<void> main() async {
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

  //TODO: To be removed (Trial) (For debugging only)
  final pokemons = await ApiService().pokemonApi.getPokemonList(offset: '0', limit: '151');
  pokemons;

  //TODO: To be removed (Trial) (For debugging only)
  final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(id: 3);
  pokemonDetails;

  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );
}
