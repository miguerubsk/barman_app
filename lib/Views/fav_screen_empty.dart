import 'package:flutter/material.dart';


class FavoriteScreenEmpty extends StatelessWidget {
  const FavoriteScreenEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'No hay favoritos todavía',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16.0,),
          Text(
            'Pulsa el botón ❤ de un cóctel para añadirlo',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
