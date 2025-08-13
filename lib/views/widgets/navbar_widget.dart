import 'package:demo/data/notifer.dart';
import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPage,
      builder: (context, pageIndex, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.calculate),
              label: 'BMI Calculate',
            ),
            NavigationDestination(
              icon: Icon(Icons.history), 
              label: 'History'),
          ],
          onDestinationSelected: (value) {
            selectedPage.value = value;
          },
          selectedIndex: pageIndex,
        );
      },
    );
  }
}
