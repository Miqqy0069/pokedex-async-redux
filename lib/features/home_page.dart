import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/state/action/pokemon_actions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    StoreProvider.dispatch(context, GetPokemonsAction());
    StoreProvider.dispatch(context, GetPokemonDetailsAction(pokemonName: 'ditto'));

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
