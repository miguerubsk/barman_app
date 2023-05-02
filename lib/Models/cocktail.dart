class Cocktail {
  int id;
  String name;
  String category;
  String iBA;
  String glass;
  String alcoholic;
  String instructionsEN;
  String? instructionsES;
  String drinkThumb;
  List<String> ingredients;
  List<String> measures;


  Cocktail({
    required this.id,
    required this.name,
    required this.category,
    required this.iBA,
    required this.glass,
    required this.alcoholic,
    required this.instructionsEN,
    required this.instructionsES,
    required this.drinkThumb,
    required this.ingredients,
    required this.measures,
  });

  factory Cocktail.fromJson(Map<String, dynamic> json){
    List<String> jIngredients = [];
    List<String> jMeasures = [];
    String ingredient = "strIngredient";
    String measure = "strMeasure";
    int i = 1;
    while(json[(ingredient + i.toString())] != null && json[(measure + i.toString())] != null){
      jIngredients.add(json[(ingredient + i.toString())]);
      jMeasures.add(json[(measure + i.toString())]);
      i++;
    }

    return Cocktail(
      id: json['idDrink'],
      name: json['strDrink'],
      category: json['strCategory'],
      glass: json['strGlass'],
      iBA: json['strIBA'],
      alcoholic: json['strAlcoholic'],
      instructionsEN: json['strInstructions'],
      instructionsES: json['strInstructionsES'],
      drinkThumb: json['strDrinkThumb'],
      ingredients: List.unmodifiable(jIngredients),
      measures: List.unmodifiable(jMeasures),
    );
  }

}