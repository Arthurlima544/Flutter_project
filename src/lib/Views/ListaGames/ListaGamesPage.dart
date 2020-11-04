import 'package:flutter/material.dart';
import 'package:src/Componentes/FavGamesDrawer.dart';
import 'package:src/Views/GameEspecifico/GameFavoritoPage.dart';
import 'bloc/ListaGamesBloc.dart';
import 'package:src/Services/ListaGames.dart';
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
        backgroundColor: Color.fromRGBO(6, 22, 47, 1),
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
                  color: Color.fromRGBO(6, 22, 47, 1),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.6),
                      blurRadius: 2,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                margin: EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameFavoritoPage(game: item),
                      ),
                    );
                  },
                  title: Text(
                    item.titulo,
                    style: TextStyle(
                      color: Color.fromRGBO(39, 174, 194, 1),
                    ),
                  ),
                  leading: IconButton(
                    icon: Icon(Icons.favorite),
                    color: Color.fromRGBO(39, 174, 194, 1),
                    onPressed: () {
                      _bloc.favoriteUpdate(item);
                    },
                  ),
                  //* Deletar
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Color.fromRGBO(39, 174, 194, 1),
                    onPressed: () {
                      _bloc.delete(item);
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(6, 22, 47, 1),
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
                  decoration: InputDecoration(
                    labelText: 'Titulo',
                  ),
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
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Cancelar",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            FlatButton(
              onPressed: () {
                _bloc.create(
                    _titulocontroller.text, 1, _descricaocontroller.text);
                Navigator.pop(context);
              },
              child: Text(
                "Salvar",
                style: TextStyle(
                  color: Color.fromRGBO(6, 22, 47, 1),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
