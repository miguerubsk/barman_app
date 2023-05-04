import 'package:barman_app/Models/cocktail.dart';
import 'package:flutter/material.dart';


class CocktailThumb extends StatelessWidget {

  final Cocktail cocktail;

  const CocktailThumb({Key? key, required this.cocktail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                cocktail.drinkThumb,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 4,),
          Text(
            cocktail.name,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ],
      ),
    );
  }
}
