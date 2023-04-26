import 'package:barman_app/barman_app_theme.dart';
import 'package:barman_app/barman_main_page.dart';
import 'package:flutter/material.dart';

class BarmanApp extends StatelessWidget {
  const BarmanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barman: Cocktail Recipes',
      theme: BarmanAppTheme.light(),
      darkTheme: BarmanAppTheme.dark(),
      themeMode: ThemeMode.system,
    );
  }
}
