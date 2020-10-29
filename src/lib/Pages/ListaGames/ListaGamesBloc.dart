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

  create(String titulo) async {
    await GamesService().create(Games(titulo, true));
  }

  delete(Games item) {
    item.reference.delete();
  }
}
