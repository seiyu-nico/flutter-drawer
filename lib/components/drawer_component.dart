// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_drawer/data/drawer_items.dart';
import 'package:flutter_drawer/models/drawer_item.dart';

class DrawerComponent extends StatelessWidget {
  final ValueChanged<DrawerItem> onSelectedItem;
  const DrawerComponent({super.key, required this.onSelectedItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
      child: SingleChildScrollView(
        child: Column(children: [buildDrawerItems(context)]),
      ),
    );
  }

  Widget buildDrawerItems(BuildContext context) {
    return Column(
      children: DrawerItems.all
          .map(
            (DrawerItem item) => ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              leading: Icon(item.icon, color: Colors.white),
              title: Text(
                item.title,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              onTap: () => onSelectedItem(item),
            ),
          )
          .toList(),
    );
  }
}
