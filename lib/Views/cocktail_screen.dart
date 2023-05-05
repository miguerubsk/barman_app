import 'package:barman_app/Models/cocktail.dart';
import 'package:flutter/material.dart';

class CocktailDetailScreen extends StatelessWidget {
  final Cocktail cocktail;
  static const TextStyle normalText = TextStyle( fontSize: 15, fontWeight: FontWeight.normal, );

  CocktailDetailScreen({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: _buildButtonColumn(),
      ),
    );
  }


  Widget _buildButtonColumn() {
    List<Widget> ingredientsColumnChildren = [];
    List<Widget> measuresColumnChildren = [];

    for (var ingredientText in cocktail.ingredients) {
      ingredientsColumnChildren.add(Text(
        ingredientText,
        textAlign: TextAlign.left,
        style: normalText,
      ));
    }
    for (var measureText in cocktail.measures) {
      measuresColumnChildren.add(Text(
        measureText,
        textAlign: TextAlign.left,
        style: normalText,
      ));
    }

    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        //Cocktail name
                        cocktail.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Image.network(
                    //Cocktail image
                    cocktail.drinkThumb,
                    fit: BoxFit.fitHeight,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    // Two inner columns nested in a row
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        //Column of ingredients
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: ingredientsColumnChildren,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Column(
                        //Column of measures
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: measuresColumnChildren,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    //Cocktail name
                    cocktail.instructionsEN,
                    textAlign: TextAlign.left,
                    style: normalText,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
