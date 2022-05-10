import 'package:flutter/material.dart';
import 'package:taekwondo_app/common/theme.dart';

class MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Catalog', style: Theme.of(context).textTheme.headline1),
      floating: true,
      actions: [
        IconButton(
          color: secondaryColor,
          icon: const Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
      ],
    );
  }
}
