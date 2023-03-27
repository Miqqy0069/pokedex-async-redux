import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_overview_card.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokedexTitle)),
      body: pokemons.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (errorMessage) {
          _noPokemonAvailableDialog(
            context,
            errorMessage,
          );
          return Center(
            child: Text(
              errorMessage ?? emptyString,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
        (data) => GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: data.length,
          itemBuilder: (_, index) {
            final pokemon = data[index];
            return PokemonOverviewCard(pokemon: pokemon);
          },
        ),
      ),
    );
  }

  void _noPokemonAvailableDialog(BuildContext context, errorMessage) {
    const snackBar = SnackBar(
      content: Text(
        snackBarErrorMessage,
        style: TextStyle(color: Colors.red),
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
