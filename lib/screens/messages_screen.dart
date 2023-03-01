// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_drawer/components/drawer_menu_component.dart';

class MessagesScreen extends StatelessWidget {
  final VoidCallback openDrawer;

  const MessagesScreen({super.key, required this.openDrawer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: DrawerMenuComponent(
          onClicked: openDrawer,
        ),
        title: const Text('MessagesScreen'),
      ),
    );
  }
}
