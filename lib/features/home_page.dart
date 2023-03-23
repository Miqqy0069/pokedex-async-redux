import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';
import 'package:pokedex_async_redux/utilities/string_constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: will be removed later / only for testing
    StoreProvider.dispatch(context, GetPokemonsAction());
    //TODO: will be removed later / only for testing
    StoreProvider.dispatch(context, GetPokemonDetailsAction(pokemonName: pokemonDitto));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Text(
            'Home Page',
            style: Theme.of(context).textTheme.displayMedium,
          ),
        ),
      ),
    );
  }
}
