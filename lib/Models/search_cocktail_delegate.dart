import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/cocktail.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:flutter/material.dart';

import '../Components/cocktail_Thumb.dart';


class SearchCocktailDelegate extends SearchDelegate<Cocktail> {

  final cocktails = CocktailList();
  List<Cocktail> _filter = [];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, const Cocktail(id: 0, name: "name", category: "category", glass: "glass", alcoholic: "alcoholic", instructionsEN: "instructionsEN", drinkThumb: "drinkThumb", ingredients: [], measures: []));
        },
        icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return CocktailGrid(cocktails: _filter,);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    _filter = cocktails.cocktails.where((cocktail) {
      return cocktail.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    _filter.addAll(
      cocktails.cocktails.where((cocktail) {
        return cocktail.ingredients.toString().toLowerCase().contains(query.toLowerCase());
      }).toList()
    );
    return CocktailGrid(cocktails: _filter,);
  }

  Widget buildGridSearch(){
    return CocktailGrid(cocktails: _filter,);
  }

}