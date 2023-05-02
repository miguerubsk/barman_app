import 'package:barman_app/Components/cocktail_Thumb.dart';
import 'package:flutter/material.dart';
import '../Models/cocktail.dart';


class CocktailGrid extends StatelessWidget {
  final List<Cocktail> cocktails;
  const CocktailGrid({Key? key, required this.cocktails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: 135,
      ),
      itemBuilder: (context, index){
        return CocktailThumb(cocktail: cocktails[index]);
      },
      itemCount: cocktails.length,
    );
  }
}
