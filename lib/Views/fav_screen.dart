import 'package:barman_app/Views/fav_screen_empty.dart';
import 'package:flutter/material.dart';



class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoriteScreenEmpty(),
    );
  }
}