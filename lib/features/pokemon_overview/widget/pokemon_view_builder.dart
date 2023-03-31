import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_overview_card.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonGridviewBuilder extends StatelessWidget {
  const PokemonGridviewBuilder({
    Key? key,
    required this.pokemons,
    this.isSearching = false,
  }) : super(key: key);

  final List<Pokemon> pokemons;
  final bool isSearching;

  @override
  Widget build(BuildContext context) {
    if (pokemons.isEmpty && isSearching) return const Center(child: Text(searchErrorMessage));

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
