import 'package:barman_app/Models/cocktail.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:flutter/material.dart';


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
    return Center();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    _filter = cocktails.cocktails.where((cocktail) {
      return cocktail.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.separated(
        itemCount: _filter.length,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 8.0,);
        },
        itemBuilder: (context, index) {
          final cocktail = _filter[index];
        },
      ),
    );
  }

}