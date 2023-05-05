import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/cocktail.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:barman_app/Models/http_cocktail_service.dart';
import 'package:barman_app/Models/search_cocktail_delegate.dart';
import 'package:barman_app/Views/cocktail_screen.dart';
import 'package:flutter/material.dart';


class SearchScreen extends StatelessWidget {

  final CocktailList cocktailList = CocktailList();
  final cocktailService = HttpCocktailService();

  SearchScreen({
    Key? key

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CocktailDetailScreen(cocktail: cocktailList.cocktails.first);
  }
}
