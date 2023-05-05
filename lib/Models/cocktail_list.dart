import 'package:barman_app/Models/cocktail.dart';
import 'package:flutter/widgets.dart';


class CocktailList extends ChangeNotifier{
  static final _cocktails = <Cocktail> [];
  List<Cocktail> get cocktails => List.unmodifiable(_cocktails);
  bool get isNotEmpty => _cocktails.isNotEmpty;
  bool get isEmpty => _cocktails.isEmpty;

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