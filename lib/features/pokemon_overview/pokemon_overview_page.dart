import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_search_bar.dart';
import 'package:pokedex_async_redux/features/pokemon_overview/widget/pokemon_view_builder.dart';
import 'package:pokedex_async_redux/utilities/async.dart';
import 'package:pokedex_async_redux/utilities/constants.dart';
import 'package:pokedex_async_redux/utilities/spacing.dart';

class PokemonOverviewPage extends StatefulWidget {
  const PokemonOverviewPage({
    required this.pokemons,
    required this.searchedPokemons,
    required this.filterPokemons,
    required this.clearSearchedPokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final Async<List<Pokemon>> searchedPokemons;
  final VoidCallback clearSearchedPokemons;
  final Function(String) filterPokemons;

  @override
  State<PokemonOverviewPage> createState() => _PokemonOverviewPageState();
}

class _PokemonOverviewPageState extends State<PokemonOverviewPage> {
  late TextEditingController _searchPokemonController;
  late bool isSearching;
  Timer? _debounceDuration;

  @override
  void initState() {
    super.initState();
    isSearching = false;
    _searchPokemonController = TextEditingController();
  }

  @override
  void dispose() {
    widget.clearSearchedPokemons();
    _searchPokemonController.dispose();
    _debounceDuration?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(pokedexTitle)),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SearchBar(
              searchController: _searchPokemonController,
              onClear: _clearSearchedPokemons,
              onChanged: _onSearchBarInputValueChanged,
            ),
            const VerticalSpace(height: 15.0),
            Expanded(
              child: isSearching
                  ? widget.searchedPokemons.when(
                      (data) => PokemonGridviewBuilder(pokemons: data),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (noSearchResultsFoundMessage) {
                        return Center(child: Text(noSearchResultsFoundMessage ?? emptyString));
                      },
                    )
                  : widget.pokemons.when(
                      (data) => PokemonGridviewBuilder(pokemons: data),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (errorMessage) {
                        WidgetsBinding.instance.addPostFrameCallback(
                            (_) => _showErrorMessageSnackBar(context, errorMessage ?? emptyString));
                        return Text(errorMessage!);
                      },
                    ),
            ),
          ],
        ),
      ),
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

  void _clearSearchedPokemons() {
    widget.clearSearchedPokemons;
    setState(() {
      _searchPokemonController.text = emptyString;
      isSearching = false;
    });
  }

  void _onSearchBarInputValueChanged(String searchInput) {
    _debounceDuration = Timer(
      const Duration(milliseconds: 500),
      () => setState(() {
        widget.filterPokemons(searchInput);
        isSearching = true;
      }),
    );
  }
}
