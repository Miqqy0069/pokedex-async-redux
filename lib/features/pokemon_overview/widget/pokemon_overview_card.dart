import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/utilities/string_extension.dart';

class PokemonOverviewCard extends StatelessWidget {
  const PokemonOverviewCard({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            pokemon.url.toCustomUrl,
            height: 150,
          ),
          Text(pokemon.name.capitalize()),
        ],
      ),
    );
  }
}
