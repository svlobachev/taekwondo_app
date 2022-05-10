import 'package:flutter/material.dart';

// Press the Navigation Drawer button to the left of AppBar to show
// a simple Drawer with two items.
class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drawerHeader = UserAccountsDrawerHeader(
      accountName: Text("accountName"),
      accountEmail: Text("accountEmail"),
      currentAccountPicture: const CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
    final drawerItems = ListView(
      children: [
        drawerHeader,
        ListTile(
          title: Text("title1"),
          leading: const Icon(Icons.favorite),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("title2"),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("title3"),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("title4"),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("title5"),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        ListTile(
          title: Text("title6"),
          leading: const Icon(Icons.comment),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
    return Drawer(
      child: drawerItems,
    );
  }
}
