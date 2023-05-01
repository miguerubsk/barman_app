import 'package:barman_app/Models/fav_list.dart';
import 'package:flutter/material.dart';


class FavoriteScreenFull extends StatelessWidget {
  const FavoriteScreenFull({Key? key, required this.favoriteList}) : super(key: key);

  final FavoriteList favoriteList;

  @override
  Widget build(BuildContext context) {
    final cocktails = favoriteList.cocktails;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.,
    );
  }
}
