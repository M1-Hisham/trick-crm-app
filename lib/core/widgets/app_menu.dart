import 'package:flutter/material.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          child: const Text('Item 1'),
          onTap: () {},
        ),
        PopupMenuItem(
          child: const Text('Item 2'),
          onTap: () {},
        ),
      ],
    );
  }
}