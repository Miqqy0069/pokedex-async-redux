import 'package:flutter/material.dart';

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
            height: 150,
          ),
          Text(pokemonName),
        ],
      ),
    );
  }
}
