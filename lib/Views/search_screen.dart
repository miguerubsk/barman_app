import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/cocktail.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:barman_app/Models/http_cocktail_service.dart';
import 'package:barman_app/Models/search_cocktail_delegate.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {

  final CocktailList cocktailList = CocktailList();
  final cocktailService = HttpCocktailService();

  SearchScreen({
    Key? key

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          onTap: () {
            showSearch(
              context: context,
              delegate: SearchCocktailDelegate(),
            );
          },
          title: const Text('Search'),
        ),
      ),
      body: CocktailGrid(cocktails: cocktailList.cocktails),
    );
  }
}
