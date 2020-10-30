import 'package:flutter/material.dart';
import 'package:src/Pages/GameEspecifico/BotaoFavoritoEvent.dart';
import 'package:src/models/ListaGamesModels.dart';
import 'BotaoFavoritoBloc.dart';

class GameFavoritoPage extends StatefulWidget {
  final Games game;
  GameFavoritoPage({Key key, this.game}) : super(key: key);

  @override
  _GameFavoritoPageState createState() => _GameFavoritoPageState();
}

class _GameFavoritoPageState extends State<GameFavoritoPage> {
  final _bloc = ContBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.game.titulo),
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
                color: Colors.blue,
                fontSize: 20,
              ),
            ),
          ),
          Center(
            child: StreamBuilder<int>(
              initialData: 0,
              stream: _bloc.outputCont,
              builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                return Container(
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
                            "${snapshot.data}",
                            style: TextStyle(fontSize: 18, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.counterEventSink.add(IncrementEvent()),
        child: Icon(Icons.favorite_outline_outlined),
        backgroundColor: Colors.red,
      ),
    );
  }
}
