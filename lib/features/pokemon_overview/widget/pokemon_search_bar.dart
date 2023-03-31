import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    required this.searchController,
    required this.onClearSearchText,
    super.key,
  });

  final TextEditingController searchController;
  final VoidCallback onClearSearchText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        suffixIcon: IconButton(
          onPressed: onClearSearchText,
          icon: const Icon(Icons.close),
        ),
      ),
      controller: searchController,
    );
  }
}
