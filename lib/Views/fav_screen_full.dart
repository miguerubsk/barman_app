import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/fav_list.dart';
import 'package:flutter/material.dart';


class FavoriteScreenFull extends StatelessWidget {
  FavoriteScreenFull({Key? key}) : super(key: key);

  final FavoriteList favoriteList = FavoriteList();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CocktailGrid(cocktails: favoriteList.cocktails),
    );
  }
}
