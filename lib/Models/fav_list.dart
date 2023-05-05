import 'package:barman_app/Models/cocktail.dart';
import 'package:flutter/material.dart';


class FavoriteList extends ChangeNotifier {
  final _favorites = <int, Cocktail>{};
  List<Cocktail> get cocktails => List.unmodifiable(_favorites.values);

  void addToFavorites(Cocktail item){
    
    _favorites.addAll();
    notifyListeners();
  }

  void removeFormFavorites(int id){
    _favorites
  }

}