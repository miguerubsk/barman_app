import 'package:barman_app/Views/fav_screen.dart';
import 'package:barman_app/Views/random_screen.dart';
import 'package:barman_app/Views/search_screen.dart';
import 'package:flutter/material.dart';


class BarmanMainPage extends StatefulWidget {
  const BarmanMainPage({Key? key, this.title = 'Barman: Cocktail Recipes'}) : super(key: key);

  final String title;

  @override
  State<BarmanMainPage> createState() => _BarmanMainPageState();
}

class _BarmanMainPageState extends State<BarmanMainPage> {

  int _activeCategory = 0;
  static var pages = <Widget>[
    FavoriteScreen(),
    RandomCocktailScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Barman: Cocktail Recipes'),),
      body: pages[_activeCategory],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeCategory,
        onTap: _changeActiveCategory,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive_sharp),
            label: 'Selección',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
        ],
      ),
    );
  }

  void _changeActiveCategory(int indice) {
    setState(() => _activeCategory = indice);
  }

}
