import 'package:flutter/material.dart';

AppBar MyAppBar = AppBar(
  title: const Text('AppBar'),
  actions: <Widget>[
    IconButton(
      icon: const Icon(Icons.add_alert),
      tooltip: 'Show Snackbar',
      onPressed: () {
        const SnackBar(content: Text('This is a snackbar'));
      },
    ),
    IconButton(
      icon: const Icon(Icons.navigate_next),
      tooltip: 'Go to the next page',
      onPressed: () {
        const SnackBar(content: Text('This is a Icon'));
      },
    ),
  ],
);
