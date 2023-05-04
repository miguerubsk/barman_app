import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:barman_app/Models/http_cocktail_service.dart';
import 'package:flutter/material.dart';


class RandomCocktailScreen extends StatelessWidget {

  final cocktailService = HttpCocktailService();

  RandomCocktailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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