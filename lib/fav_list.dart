import 'package:barman_app/cocktail.dart';
import 'package:flutter/widgets.dart';


class FavoriteList extends ChangeNotifier{
  final _cocktails = <Cocktail> [];
  List<Cocktail> get cocktails => List.unmodifiable(_cocktails);

  void removeCocktailAt(int index){
    if(_cocktails.isNotEmpty && _cocktails.length > index){
      _cocktails.removeAt(index);
      notifyListeners();
    }
  }

  void removeCocktail(Cocktail item){
    _cocktails.remove(item);
    notifyListeners();
  }

  void clearCocktails(){
    _cocktails.clear();
    notifyListeners();
  }

  void addCocktail(Cocktail item){
    _cocktails.add(item);
    notifyListeners();
  }

}