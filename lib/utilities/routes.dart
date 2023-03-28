import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/features/pokemon_details/pokemon_details_connector.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/pokemon_overview_connector.dart';

final routes = {
  '/': (BuildContext _) => const PokemonOverviewConnector(),
  PokemonDetailsConnector.routeName: (BuildContext _) => const PokemonDetailsConnector()
};
