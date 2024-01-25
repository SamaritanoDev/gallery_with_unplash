import 'package:flutter/material.dart';

class NavigationCustom extends StatefulWidget {
  const NavigationCustom({super.key});

  @override
  State<NavigationCustom> createState() => _NavigationCustomState();
}

class _NavigationCustomState extends State<NavigationCustom> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;

    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
        if (index == 0) {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      },
      indicatorColor: color.onPrimary,
      selectedIndex: currentPageIndex,
      destinations: [
        NavigationDestination(
          selectedIcon: Icon(Icons.home_outlined, color: color.secondary),
          icon: Icon(Icons.home_outlined, color: color.tertiary),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.settings_outlined, color: color.secondary),
          label: 'Settings',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite_border_outlined, color: color.secondary),
          label: 'Favorite',
        ),
        NavigationDestination(
          icon: Icon(Icons.share_outlined, color: color.secondary),
          label: 'Shared',
        ),
      ],
    );
  }
}
