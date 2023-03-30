import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.searchController,
    required this.onClear,
    required this.onChanged,
    super.key,
  });

  final TextEditingController searchController;
  final VoidCallback onClear;
  final Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: onClear,
          icon: const Icon(Icons.close),
        ),
      ),
      controller: searchController,
      onChanged: onChanged,
    );
  }
}
