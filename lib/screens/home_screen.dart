// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_drawer/components/drawer_menu_component.dart';

class HomeScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const HomeScreen({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: DrawerMenuComponent(
          onClicked: openDrawer,
        ),
        backgroundColor: Colors.transparent,
        title: const Text('HomeScreen'),
      ),
    );
  }
}
