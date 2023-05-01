class Cocktail {
  final int _id;
  final String _name;
  final String _category;
  final String _iBA;
  final String _glass;
  final String _alcoholic;
  final String _instructionsEN;
  final String? _instructionsES;
  final String _drinkThumb;
  final List<String> _ingredients;
  final List<String> _tags;

  Cocktail(
      this._id,
      this._name,
      this._category,
      this._iBA,
      this._glass,
      this._alcoholic,
      this._instructionsEN,
      this._instructionsES,
      this._drinkThumb,
      this._ingredients,
      this._tags
  );

  List<String> get tags => _tags;

  List<String> get ingredients => _ingredients;

  String get drinkThumb => _drinkThumb;

  String? get instructionsES => _instructionsES;

  String get instructionsEN => _instructionsEN;

  String get alcoholic => _alcoholic;

  String get glass => _glass;

  String get iBA => _iBA;

  String get category => _category;

  String get name => _name;

  int get id => _id;
}