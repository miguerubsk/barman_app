class Cocktail {
  final int id;
  final String name;
  final String category;
  final String glass;
  final String alcoholic;
  final String instructionsEN;
  final String drinkThumb;
  final List<String> ingredients;
  final List<String> measures;
  bool isFavorite;

  Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.glass,
    required this.alcoholic,
    required this.instructionsEN,
    required this.drinkThumb,
    required this.ingredients,
    required this.measures,
    required this.isFavorite,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json) {
    List<String> jIngredients = [];
    List<String> jMeasures = [];
    String ingredient = "strIngredient";
    String measure = "strMeasure";
    int i = 1;
    while (json[(ingredient + i.toString())] != null || json[(measure + i.toString())] != null) {
        if(json[(ingredient + i.toString())] != null){
          jIngredients.add(json[(ingredient + i.toString())]);
        }
        if(json[(measure + i.toString())] != null){
          jMeasures.add(json[(measure + i.toString())]);
        }
      i++;
    }

    return Cocktail(
      id: int.parse(json['idDrink']),
      name: json['strDrink'],
      category: json['strCategory'],
      glass: json['strGlass'],
      alcoholic: json['strAlcoholic'],
      instructionsEN: json['strInstructions'],
      drinkThumb: json['strDrinkThumb'],
      ingredients: List.unmodifiable(jIngredients),
      measures: List.unmodifiable(jMeasures),
      isFavorite: false,
    );
  }

  @override
  String toString() {
    return 'Cocktail{id: $id, name: $name}';
  }
}
