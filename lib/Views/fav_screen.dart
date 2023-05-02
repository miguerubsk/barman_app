import 'package:barman_app/Models/fav_list.dart';
import 'package:barman_app/Views/fav_screen_empty.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildFavoriteScreen(),
    );
  }

  Widget buildFavoriteScreen() {
    return Consumer<FavoriteList>(
      builder: (context, manager, child) {
        if(manager.cocktails.isNotEmpty){
          return FavoriteScreenEmpty(favoriteList: manager,);
        } else {
          return const FavoriteScreenEmpty();
        }
      },
    )
  }

}