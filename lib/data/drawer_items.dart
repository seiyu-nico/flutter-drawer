// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_drawer/models/drawer_item.dart';

class DrawerItems {
  static const home = DrawerItem(title: 'Home', icon: Icons.home);
  static const explore = DrawerItem(title: 'Explore', icon: Icons.explore);
  static const favorites = DrawerItem(title: 'Favorites', icon: Icons.favorite);
  static const messages = DrawerItem(title: 'Messages', icon: Icons.message);
  static const profile = DrawerItem(title: 'Profile', icon: Icons.person);
  static const settings = DrawerItem(title: 'Setting', icon: Icons.settings);
  static const logout = DrawerItem(title: 'Logout', icon: Icons.logout);

  static final List<DrawerItem> all = [
    home,
    explore,
    favorites,
    messages,
    profile,
    settings,
    logout,
  ];
}
