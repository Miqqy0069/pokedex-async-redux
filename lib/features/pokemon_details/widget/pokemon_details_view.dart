import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/ability.dart';
import 'package:pokedex_async_redux/api/model/moves.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';
import 'package:pokedex_async_redux/api/model/stats.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/spacing.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({
    Key? key,
    required this.pokemonDetails,
  }) : super(key: key);

  final PokemonDetails pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(70.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                pokemonInformationLabel,
                style: TextStyle(fontSize: 18),
              ),
              const VerticalSpace(height: 10.0),
              Text('$heightLabel ${pokemonDetails.height}'),
              Text('$weightLabel ${pokemonDetails.weight}'),
              Text('$baseExperienceLabel ${pokemonDetails.baseExperience}'),
              const VerticalSpace(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    abilitiesLabel,
                    style: TextStyle(fontSize: 18),
                  ),
                  const VerticalSpace(height: 10.0),
                  for (Ability ability in pokemonDetails.abilities) Text(ability.ability.name.capitalize()),
                ],
              ),
              const VerticalSpace(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    movesLabel,
                    style: TextStyle(fontSize: 18),
                  ),
                  const VerticalSpace(height: 10.0),
                  for (Moves moves in pokemonDetails.moves) Text(moves.move.name.capitalize()),
                ],
              ),
              const VerticalSpace(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    statsLabel,
                    style: TextStyle(fontSize: 18),
                  ),
                  const VerticalSpace(height: 10.0),
                  for (Stats stats in pokemonDetails.stats)
                    Text('${stats.stat.name.capitalize()}: ${stats.baseStat.toString()}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
