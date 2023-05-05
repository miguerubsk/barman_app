import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/cocktail.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:flutter/material.dart';
import '../Models/http_cocktail_service.dart';


class FavoriteScreenFull extends StatelessWidget {

  final List<Cocktail> search;
  final cocktailService = HttpCocktailService();

  FavoriteScreenFull({Key? key, required this.search}) : super(key: key);

  final CocktailList favoriteList = CocktailList();

  @override
  Widget build(BuildContext context) {

    for(var str in search){
      //str.replaceAll(' ', '_');
    }

    return FutureBuilder(
      future: cocktailService.getRandomCocktails(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('No se puede conectar con el servidor'),
            );
          } else {
            return Center(
              child: CocktailGrid(cocktails: snapshot.data),
            );
          }
        } else {
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
}
