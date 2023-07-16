import 'package:flutter/material.dart';
import 'package:raffler/utils/constants.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'a',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bolt),
          label: 'a',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.apps_outlined),
          label: 'a',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'a',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'a',
        ),
      ],
    );
  }
}
