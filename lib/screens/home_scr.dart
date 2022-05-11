import 'package:flutter/material.dart';
import 'package:taekwondo_app/widgets/navigation/bottomNavigationBar.dart';
import 'package:taekwondo_app/widgets/navigation/myAppBar.dart';
import 'package:taekwondo_app/widgets/navigation/navDrawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar,
      drawer: NavDrawer(),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
