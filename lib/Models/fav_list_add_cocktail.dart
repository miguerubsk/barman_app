import 'package:barman_app/Models/cocktail_list.dart';
import 'package:flutter/material.dart';
import 'cocktail.dart';
import 'http_cocktail_service.dart';


class FavoriteListAddCocktail extends StatefulWidget {

  final Function(Cocktail) searchCocktail;

  const FavoriteListAddCocktail({
    Key? key,
    required this.searchCocktail
  }) : super(key: key);

  @override
  State<FavoriteListAddCocktail> createState() => _FavoriteListAddCocktailState();
}

class _FavoriteListAddCocktailState extends State<FavoriteListAddCocktail> {

  final _nameController = TextEditingController();
  String _name = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              Navigator.pop(context);
              //widget.searchCocktail(_nameController.text);
            },
          )
        ],
        elevation: 0.0,
        title: const Text('Buscar', ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            buildNameField(),
          ],
        ),
      ),
    );
  }


  Widget buildNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Nombre del cóctel',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            hintText: 'Sangria, Old Pal, Frappé, etc.',
          ),
        )
      ],
    );
  }


  @override
  void initState() {
    super.initState();
    _nameController.addListener(() {
      setState(() { _name = _nameController.text; });
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

}
