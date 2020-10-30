import 'package:flutter/material.dart';
import 'package:src/Componentes/FavGamesDrawer.dart';
import 'package:src/Pages/GameEspecifico/GameFavoritoPage.dart';
import 'ListaGamesBloc.dart';
import 'package:src/db/ListaGames.dart';
import 'package:src/models/ListaGamesModels.dart';

class ListaGamesPage extends StatefulWidget {
  @override
  _ListaGamesPageState createState() => _ListaGamesPageState();
}

class _ListaGamesPageState extends State<ListaGamesPage> {
  MyAppBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = MyAppBloc(GamesService());

    return Scaffold(
      appBar: AppBar(
        title: Text("Games Favoritos"),
      ),
      drawer: FavGamesDrawer(),
      body: StreamBuilder<List<Games>>(
          initialData: [],
          stream: _bloc.output,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length, // tamanho da lista de documentos
              itemBuilder: (BuildContext _, int index) {
                final item = snapshot.data[index];

                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        blurRadius: 2,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameFavoritoPage(game: item),
                        ),
                      );
                    },
                    title: Text(item.titulo),
                    //* Deletar
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Colors.black,
                      onPressed: () {
                        _bloc.delete(item);
                      },
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _showDialog(context);
        },
      ),
    );
  }

//! pq não faz diferença eu colocar ela como async? ou faz diferença?
  _showDialog(BuildContext context) {
    final _titulocontroller = TextEditingController();
    final _descricaocontroller = TextEditingController();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Jogo favorito"),
            content: Column(
              children: <Widget>[
                ListTile(
                  title: TextFormField(
                    controller: _titulocontroller,
                    decoration: InputDecoration(labelText: 'Titulo'),
                  ),
                ),
                ListTile(
                  title: TextFormField(
                    controller: _descricaocontroller,
                    decoration: InputDecoration(labelText: 'Descricao'),
                  ),
                ),
              ],
            ),
            /* TextField(
              controller: _controller,
            ), */
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    _bloc.create(
                        _titulocontroller.text, 1, _descricaocontroller.text);
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")),
            ],
          );
        });
  }
}
