import 'package:flutter/material.dart';
import 'package:src/Componentes/FavGamesDrawer.dart';
import 'ImageWidget.dart';

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
        backgroundColor: Color.fromRGBO(6, 22, 47, 1),
      ),
      drawer: FavGamesDrawer(),
      body: Container(
        child: showImage(),
      ),
    );
  }

  showImage() {
    return Image.network(
      "https://i.pinimg.com/originals/86/e0/b0/86e0b01d272d893e666d7a1946024f9c.jpg",
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }
}
