import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/cocktail_list.dart';
import 'package:barman_app/Models/search_cocktail_delegate.dart';
import 'package:flutter/material.dart';

import '../Models/http_cocktail_service.dart';


class SearchScreen extends StatelessWidget {

  final cocktails = CocktailList();
  final cocktailService = HttpCocktailService();

  SearchScreen({Key? key}) : super(key: key);

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
                child: buildFavoriteScreen(context),
              );
            }
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      );
    }else{
      return Center(
        child: buildFavoriteScreen(context),
      );
    }
  }

  Widget buildFavoriteScreen(BuildContext context){
    return Scaffold(
      body: CocktailGrid(cocktails: cocktails.cocktails),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        onPressed: () {
          showSearch(
            context: context,
            delegate: SearchCocktailDelegate(),
          );
        },
        child: const Icon(Icons.search),
      ),
    );
  }

}