import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:barman_app/Models/fav_list_add_cocktail.dart';
import 'package:barman_app/Views/fav_screen_empty.dart';
import 'package:barman_app/Views/fav_screen_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/http_cocktail_service.dart';


class FavoriteScreen extends StatelessWidget {

  final cocktails = CocktailList();
  final cocktailService = HttpCocktailService();

  FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(cocktails.isEmpty){
      return FutureBuilder(
        future: cocktailService.getAllCocktails(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              //print(snapshot.error);
              return const Center(
                child: Text('No se puede conectar con el servidor'),
              );
            } else {
              for(var cocktail in snapshot.data){
                cocktails.addCocktail(cocktail);
              }
              return Center(
                child: CocktailGrid(cocktails: snapshot.data),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      );
    }else{
      return Center(
        child: CocktailGrid(cocktails: cocktails.cocktails,),
      );
    }
  }

}