import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_overview_card.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/string_extension.dart';

class PokemonOverviewPage extends StatelessWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    Key? key,
  }) : super(key: key);

  final List<Pokemon> pokemons;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(pokedexTitle),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: defaultTwoInt,
          childAspectRatio: defaultOneDouble,
          crossAxisSpacing: defaultTenDouble,
          mainAxisSpacing: defaultTenDouble,
        ),
        itemCount: pokemons.length,
        itemBuilder: (context, index) {
          final pokemon = pokemons[index];
          final pokemonIndex = index + defaultOneInt;
          final imgUrl = imageURL.replaceFirst(urlIndex, pokemonIndex.toString());
          return PokemonOverviewCard(pokemonName: pokemon.name.toFirstLetterUpperCase(),
            imgUrl: imgUrl);
        },
      ),
    );
  }
}
