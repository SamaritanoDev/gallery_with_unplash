import 'package:flutter/material.dart';

class SearchCustom extends StatelessWidget {
  const SearchCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SearchBar(
      hintText: 'Search',
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          Icons.search,
          color: color.secondary,
        ),
      ),
    );
  }
}
