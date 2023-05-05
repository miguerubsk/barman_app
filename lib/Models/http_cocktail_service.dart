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

  Future<List<Cocktail>> getCocktails(List<String> url) async {
    final cocktails = <Cocktail>[];
    for (var search in url) {
      final readFromServer = await _loadFromHttp(
          'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=$search"');
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

  Future<List<Cocktail>> getAllCocktails() async {
    final cocktails = <Cocktail>[];
    var letters = [ 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' ];
    for (var letter in letters) {
      final readFromServer = await _loadFromHttp(
          "https://www.thecocktaildb.com/api/json/v1/1/search.php?f=$letter");
      final Map<String, dynamic> json = jsonDecode(readFromServer);
      if (json['drinks'] != null) {
        for (var cocktail in json['drinks']) {
          try {
            cocktails.add(Cocktail.fromJson(cocktail));
          } catch (e) {
            print(e);
          }
        }
      }
    }
    if (cocktails.isNotEmpty) {
      return cocktails;
    } else {
      return [];
    }
  }

  Future<List<Cocktail>> getRandomCocktails() async {
    final cocktails = <Cocktail>[];
    for (int i = 0; i < 10; i++) {
      final readFromServer = await _loadFromHttp(
          'https://www.thecocktaildb.com/api/json/v1/1/random.php');
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
