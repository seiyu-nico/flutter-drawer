// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:flutter_drawer/components/drawer_component.dart';
import 'package:flutter_drawer/data/drawer_items.dart';
import 'package:flutter_drawer/models/drawer_item.dart';
import 'package:flutter_drawer/screens/explorer_screen.dart';
import 'package:flutter_drawer/screens/favorites_screen.dart';
import 'package:flutter_drawer/screens/home_screen.dart';
import 'package:flutter_drawer/screens/messages_screen.dart';
import 'package:flutter_drawer/screens/profile_screen.dart';
import 'package:flutter_drawer/screens/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color.fromRGBO(21, 30, 61, 1)),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double xOffset;
  late double yOffset;
  late double scaleFactor;
  late bool isDrawerOpen;
  DrawerItem item = DrawerItems.home;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();
    openDrawer();
  }

  void openDrawer() {
    setState(() {
      xOffset = 250;
      yOffset = 150;
      scaleFactor = 0.7;
      isDrawerOpen = true;
    });
  }

  void closeDrawer() {
    setState(() {
      xOffset = 0;
      yOffset = 0;
      scaleFactor = 1;
      isDrawerOpen = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(children: [buildDrawer(), buildPage()]),
    );
  }

  Widget buildDrawer() => SafeArea(
          child: SizedBox(
        width: xOffset,
        child: DrawerComponent(
          onSelectedItem: (item) {
            switch (item) {
              case DrawerItems.logout:
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('Logging Out')));
                return;
              default:
                setState(() {
                  this.item = item;
                });
                closeDrawer();
            }
          },
        ),
      ));

  Widget buildPage() {
    return WillPopScope(
      onWillPop: () async {
        if (isDrawerOpen) {
          closeDrawer();
          return false;
        }
        return true;
      },
      child: GestureDetector(
        onTap: closeDrawer,
        onHorizontalDragStart: (details) => isDragging = true,
        onHorizontalDragUpdate: (details) {
          if (!isDragging) return;
          const delta = 1;
          if (details.delta.dx > delta) {
            openDrawer();
          } else if (details.delta.dx < -delta) {
            closeDrawer();
          }
          isDragging = false;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor),
          child: AbsorbPointer(
            absorbing: isDrawerOpen,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0),
              child: Container(
                color: isDrawerOpen
                    ? Colors.white12
                    : Theme.of(context).primaryColor,
                child: getDrawerPage(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getDrawerPage() {
    switch (item) {
      case DrawerItems.explore:
        return ExplorerScreen(openDrawer: openDrawer);
      case DrawerItems.favorites:
        return FavoritesScreen(openDrawer: openDrawer);
      case DrawerItems.messages:
        return MessagesScreen(openDrawer: openDrawer);
      case DrawerItems.profile:
        return ProfileScreen(openDrawer: openDrawer);
      case DrawerItems.settings:
        return SettingsScreen(openDrawer: openDrawer);
      case DrawerItems.logout:
      case DrawerItems.home:
      default:
        return HomeScreen(openDrawer: openDrawer);
    }
  }
}
