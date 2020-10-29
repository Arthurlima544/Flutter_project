import 'package:flutter/material.dart';
import 'package:src/Pages/GameEspecifico/GameEspecifico.dart';
import 'package:src/my_widgets/FavGamesDrawer.dart';
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

                return ListTile(
                  onTap: () {
                    /* Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Item " + item.titulo + " Clicado"),
                      ),
                    ); */
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NovoGamePage(
                                titulo: item.titulo,
                              )),
                    );
                    //https://flutter.dev/docs/cookbook/design/snackbars
                    /* action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                         
                    },
                  ), */
                  },
                  title: Text(
                    item.titulo,
                  ),
                  /* subtitle: Text(item.), */
                  leading: IconButton(
                    icon: Icon(Icons.favorite),
                    color: Colors.red,
                    onPressed: () {},
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.black,
                    onPressed: () {
                      _bloc.delete(item);
                    },
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
    final _controller = TextEditingController();

    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Digite o Jogo"),
            content: TextField(
              controller: _controller,
            ),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancelar")),
              FlatButton(
                  onPressed: () {
                    _bloc.create(_controller.text);
                    Navigator.pop(context);
                  },
                  child: Text("Salvar")),
            ],
          );
        });
  }
}
