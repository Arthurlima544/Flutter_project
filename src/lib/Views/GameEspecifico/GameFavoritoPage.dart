import 'package:flutter/material.dart';
import 'package:src/models/ListaGamesModels.dart';

class GameFavoritoPage extends StatefulWidget {
  final Games game;
  GameFavoritoPage({Key key, this.game}) : super(key: key);

  @override
  _GameFavoritoPageState createState() => _GameFavoritoPageState();
}

class _GameFavoritoPageState extends State<GameFavoritoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.titulo),
        backgroundColor: Color.fromRGBO(6, 22, 47, 1),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Text(
              "Descrição: " + widget.game.descricao,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(6, 22, 47, 1),
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: Container(
              height: 200.0,
              decoration: new BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Container(
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.favorite_border,
                        color: Colors.red,
                        size: 100.0,
                      ),
                      Text(
                        "${widget.game.favorito}",
                        style: TextStyle(fontSize: 18, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
