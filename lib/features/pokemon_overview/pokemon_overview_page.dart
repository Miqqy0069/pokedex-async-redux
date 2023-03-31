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
    required this.onClearSearchedPokemons,
    required this.onSearchPokemons,
    Key? key,
  }) : super(key: key);

  final Async<List<Pokemon>> pokemons;
  final List<Pokemon> searchedPokemons;
  final VoidCallback onClearSearchedPokemons;
  final ValueChanged onSearchPokemons;

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

    _searchPokemonController = TextEditingController()..addListener(_onSearchPokemons);
    isSearching = false;
  }

  @override
  void dispose() {
    _onClearSearchedPokemons();
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
              onClearSearchText: _clearSearchedPokemons,
            ),
            const VerticalSpace(height: 15.0),
            Expanded(
              child: isSearching
                  ? PokemonGridviewBuilder(
                      pokemons: widget.searchedPokemons,
                      isSearching: true,
                    )
                  : widget.pokemons.when(
                      (data) => PokemonGridviewBuilder(pokemons: data),
                      loading: () => const Center(child: CircularProgressIndicator()),
                      error: (errorMessage) {
                        WidgetsBinding.instance.addPostFrameCallback((_) => _showErrorMessageSnackBar(
                              context,
                              errorMessage ?? emptyString,
                            ));
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

  void _onSearchPokemons() {
    if (_debounceDuration?.isActive ?? false) _debounceDuration?.cancel();
    _debounceDuration = Timer(const Duration(milliseconds: 500), _searchPokemons);
  }

  void _searchPokemons() {
    widget.onSearchPokemons(_searchPokemonController.text);
    isSearching = true;
  }

  void _clearSearchedPokemons() {
    widget.onClearSearchedPokemons;
    _searchPokemonController.clear();
    setState(() => isSearching = false);
  }

  void _onClearSearchedPokemons() {
    if (widget.searchedPokemons.isNotEmpty) widget.onClearSearchedPokemons;
  }
}
