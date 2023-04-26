import 'package:barman_app/fav_screen.dart';
import 'package:barman_app/random_screen.dart';
import 'package:barman_app/search_screen.dart';
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
    RandomCocktailScreen(),
    FavoriteScreen(),
    SearchScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Monster Chef'),),
      body: pages[_activeCategory],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _activeCategory,
        onTap: _changeActiveCategory,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.all_inclusive_sharp),
            label: 'Selección',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Búsqueda',
          ),
        ],
      ),
    );
  }

  void _changeActiveCategory(int indice) {
    setState(() => _activeCategory = indice);
  }

}
