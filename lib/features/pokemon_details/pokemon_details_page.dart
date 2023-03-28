import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';
import 'package:pokedex_async_redux/features/pokemon_details/widget/pokemon_details_view.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';

class PokemonDetailsPage extends StatelessWidget {
  const PokemonDetailsPage({
    Key? key,
    required this.pokemonDetails,
  }) : super(key: key);

  final Async<PokemonDetails> pokemonDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokemonDetailsAppbarTitle)),
      body: pokemonDetails.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (errorMessage) {
            WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackBar(context, errorMessage));
            return const Center(
              child: Text(
                pokemonDetailsUnavailableLabel,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            );
          },
          (data) => PokemonDetailsView(pokemonDetails: data)),
    );
  }

  void _showErrorMessageSnackBar(BuildContext context, String? errorMessage) {
    final SnackBar snackBar = SnackBar(
      content: Text(
        errorMessage ?? emptyString,
        style: const TextStyle(color: Colors.red),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
