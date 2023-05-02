import 'dart:convert';
import 'package:barman_app/Models/cocktail.dart';
import 'package:http/http.dart';
import 'dart:io';


class HttpCocktailService {


  Future<String> _loadFromHttp(String url) async {
    final checkedURL = Uri.parse(url);
    final response = await get(checkedURL);
    if (response.statusCode == HttpStatus.ok) {
      return response.body;
    } else {
      return '';
    }
  }

  Future<List<Cocktail>> getCocktails(String url) async {
    final readFromServer = await _loadFromHttp(url);
    final Map<String, dynamic> json = jsonDecode(readFromServer);
    if (json['drinks'] != null) {
      final cocktails = <Cocktail>[];
      for (var cocktail in json['drinks']) {
        cocktails.add(Cocktail.fromJson(cocktail));
      }
      return cocktails;
    } else {
      return [];
    }
  }

  Future<List<Cocktail>> getRandomCocktails() async {
    final cocktails = <Cocktail>[];
    for (int i = 0; i < 10; i++) {
      final readFromServer = await _loadFromHttp(
          'www.thecocktaildb.com/api/json/v1/1/random.php');
      final Map<String, dynamic> json = jsonDecode(readFromServer);
      if (json['drinks'] != null) {
        for (var cocktail in json['drinks']) {
          cocktails.add(Cocktail.fromJson(cocktail));
        }
      }
    }
    if (cocktails.isNotEmpty) {
      return cocktails;
    } else {
      return [];
    }
  }
}