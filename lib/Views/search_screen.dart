import 'package:barman_app/Components/cocktails_grid.dart';
import 'package:flutter/material.dart';
import 'package:barman_app/Models/cocktail.dart';
import 'package:barman_app/Models/http_cocktail_service.dart';


class SearchScreen extends StatelessWidget {


  const SearchScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buscar por nombre'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
               context: context,
               delegate: CustomSearch()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
      )
    );
  }
}
class CustomSearch extends SearchDelegate {
  final cocktailService = HttpCocktailService();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: (){
          query = '';
        }
      )
    ];
  }
  @override
  IconButton buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: (){
        close(context, null);
      },
    );
  }
  @override
  Widget buildResults(BuildContext context) {

    //todo literalmente igual que buildSuggestions
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) async {

    String UrlCocktail="www.thecocktaildb.com/api/json/v1/1/search.php?s=";
    UrlCocktail=UrlCocktail+query.toLowerCase();

    if(cocktailService.getCocktails(UrlCocktail)==null){
      return Center(
        child: Text("Cocktail no encontrado"),
      );
    }else{
      future: var cocktailBuscado = cocktailService.getCocktails(UrlCocktail);
      return Center(
        child: CocktailGrid(cocktails: await cocktailService.getCocktails(UrlCocktail),)
      );
    }




  }

}
