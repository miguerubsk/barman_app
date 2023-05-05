import 'package:barman_app/Models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetailScreen extends StatelessWidget {
  final Cocktail cocktail;

  CocktailDetailScreen({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildButtonColumn();
  }

  Widget _tileSectionBuilder(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            /*1*/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /*2*/
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    cocktail.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal,
                      fontSize: 40
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonColumn(){
    List<Widget> ingredientsColumnChildren = [];
    List<Widget> measuresColumnChildren = [];

    for (var ingredientText in cocktail.ingredients){
      ingredientsColumnChildren.add(
          Text(
            ingredientText,
            textAlign: TextAlign.left,
          )
      );
    }
    for(var measureText in cocktail.measures){
      measuresColumnChildren.add(
          Text(
            measureText,
            textAlign: TextAlign.left,
          )
      );
    }

    return Stack(
      children: [
        Image.network(
          cocktail.drinkThumb,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cocktail.name,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10,),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ingredientsColumnChildren,
                  ),
                  const SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: measuresColumnChildren,
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

}
