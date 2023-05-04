import 'package:barman_app/Components/barman_app_theme.dart';
import 'package:barman_app/Views/barman_main_page.dart';
import 'package:barman_app/Models/fav_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BarmanApp extends StatelessWidget {
  const BarmanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Barman: Cocktail Recipes',
      theme: BarmanAppTheme.light(),
      darkTheme: BarmanAppTheme.dark(),
      themeMode: ThemeMode.system,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => FavoriteList(),),
        ],
        child: BarmanMainPage(),
      ),
    );
  }
}
