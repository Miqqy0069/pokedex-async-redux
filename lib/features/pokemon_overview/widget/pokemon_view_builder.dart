import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_overview_card.dart';

class PokemonGridviewBuilder extends StatelessWidget {
  const PokemonGridviewBuilder({Key? key, required this.pokemons}) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: pokemons.length,
      itemBuilder: (_, index) {
        final pokemon = pokemons[index];
        return PokemonOverviewCard(pokemons: pokemon);
      },
    );
  }
}
