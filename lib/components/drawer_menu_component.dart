// Flutter imports:
import 'package:flutter/material.dart';

class DrawerMenuComponent extends StatelessWidget {
  final VoidCallback onClicked;
  const DrawerMenuComponent({super.key, required this.onClicked});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onClicked,
      icon: const Icon(Icons.menu),
      color: Colors.white,
    );
  }
}
