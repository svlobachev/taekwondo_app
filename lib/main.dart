import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taekwondo_app/common/theme_scheme.dart';
import 'package:taekwondo_app/models/cart_model.dart';
import 'package:taekwondo_app/models/catalog_model.dart';
import 'package:taekwondo_app/screens/cart_scr.dart';
import 'package:taekwondo_app/screens/catalog_scr.dart';
import 'package:taekwondo_app/screens/home_scr.dart';
import 'package:taekwondo_app/screens/login_scr.dart';
import 'package:taekwondo_app/widgets/navigation/bottomNavigationBar.dart';
import 'package:window_size/window_size.dart';

void main() {
  setupWindow();
  runApp(const MyApp());
}

ThemeMode themeMode = ThemeMode.system;

const double windowWidth = 400;
const double windowHeight = 800;

void setupWindow() {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    setWindowTitle('Provider Demo');
    setWindowMinSize(const Size(windowWidth, windowHeight));
    setWindowMaxSize(const Size(windowWidth, windowHeight));
    getCurrentScreen().then((screen) {
      setWindowFrame(Rect.fromCenter(
        center: screen!.frame.center,
        width: windowWidth,
        height: windowHeight,
      ));
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider is convenient when providing multiple objects.
    return MultiProvider(
      providers: [
        // In this sample app, CatalogModel never changes, so a simple Provider
        // is sufficient.
        Provider(create: (context) => CatalogModel()),

        // CartModel is implemented as a ChangeNotifier, which calls for the use
        // of ChangeNotifierProvider. Moreover, CartModel depends
        // on CatalogModel, so a ProxyProvider is needed.
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        themeMode: themeMode,
        title: 'Provider Demo',
        // подключить готовые библиотечные темы
        // theme: FlexThemeData.light(scheme: FlexScheme.deepBlue),
        // darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepBlue),
        // подключить пользовательскую тему
        theme: MyFlexThemeDataLight,
        darkTheme: MyFlexThemeDataDart,
        initialRoute: '/',
        routes: {
          '/': (context) => const MyLogin(),
          '/home': (context) => HomePage(),
          '/bottom_navigation': (context) => bottomNavigationBar,
          '/catalog': (context) => const MyCatalog(),
          '/cart': (context) => const MyCart(),
        },
      ),
    );
  }
}
