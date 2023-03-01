// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_drawer/components/drawer_menu_component.dart';

class ExplorerScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const ExplorerScreen({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: DrawerMenuComponent(
          onClicked: openDrawer,
        ),
        title: const Text('ExplorerScreen'),
      ),
    );
  }
}
