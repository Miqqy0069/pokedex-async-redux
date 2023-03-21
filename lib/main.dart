import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
<<<<<<< HEAD
import 'package:pokedex_async_redux/api/api_service.dart';
=======
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
import 'package:pokedex_async_redux/features/home_page.dart';
import 'package:pokedex_async_redux/state/app_state.dart';
import 'package:flutter/material.dart';

<<<<<<< HEAD
//TODO: Future to be removed.
Future<void> main() async {
=======
void main() {
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
  final store = Store<AppState>(
    initialState: AppState(),
    actionObservers: kReleaseMode ? null : [ConsoleActionObserver<AppState>()],
  );

<<<<<<< HEAD
  //TODO: To be removed (Trial) (For debugging only)
  final pokemons = await ApiService().pokemonApi.getPokemonList(offset: '0', limit: '151');
  pokemons;

  //TODO: To be removed (Trial) (For debugging only)
  final pokemonDetails = await ApiService().pokemonApi.getPokemonDetails(id: 3);
  pokemonDetails;

=======
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
  runApp(
    StoreProvider(
      store: store,
      child: const HomePage(),
    ),
  );
<<<<<<< HEAD
}
=======
}
>>>>>>> 1539966531f205e0de9a6c07cdaa9f7028c7e853
