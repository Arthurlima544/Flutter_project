import 'package:flutter/material.dart';
import 'package:src/my_widgets/FavGamesDrawer.dart';

class ListaGamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Games Favoritos"),
      ),
      drawer: FavGamesDrawer(),
      /* body: , */
      body: Column(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.of(context).pushNamed("/novogame"),
      ),
    );
  }
}
