import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonOverviewCard extends StatelessWidget {
  const PokemonOverviewCard({
    Key? key,
    required this.pokemonName,
    required this.imgUrl,
  }) : super(key: key);

  final String pokemonName;
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imgUrl,
            height: defaultOneHundredFiftyDouble,
          ),
          Text(pokemonName),
        ],
      ),
    );
  }
}
