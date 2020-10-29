import 'dart:async';
import 'package:src/models/ListaGamesModels.dart';
import 'package:src/db/ListaGames.dart';
import 'package:src/db/ListaGamesinterface.dart';

class MyAppBloc {
  final _controller = StreamController<List<Games>>();
  Stream<List<Games>> get output => _controller.stream;
  Sink<List<Games>> get input => _controller.sink;

  MyAppBloc(ListaGamesServiceInterface service) {
    //voce ouve a stream para gerar eventos...
    service.getList().listen((event) {
      //StreamSubscription
      input.add(event);
    });
  }

  dispose() {
    _controller.close();
  }

  update(Games item, bool value) {
    item.favorito = value;
    item.reference.set(item.toMap());
  }

  //async transforma uma função parecida com o future... onde vai
  create(String titulo) async {
    //vai esperar o GamesService ser execultado para retornar
    await GamesService().create(Games(titulo, true));
  }

  delete(Games item) {
    item.reference.delete();
  }
}
