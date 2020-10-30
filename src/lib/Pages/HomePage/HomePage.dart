import 'package:flutter/material.dart';
import 'package:src/Componentes/FavGamesDrawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bem vindo ao Fav_games"),
      ),
      drawer: FavGamesDrawer(),
    );
  }
}
