import 'dart:async';
import 'package:src/models/ListaGamesModels.dart';
import 'package:src/Services/ListaGames.dart';

class MyAppBloc {
  final _controller = StreamController<List<Games>>();
  Stream<List<Games>> get output => _controller.stream;
  Sink<List<Games>> get input => _controller.sink;
  //Construtor
  MyAppBloc(GamesService service) {
    //voce ouve a stream para gerar eventos...
    service.getList().listen(
      (event) {
        //StreamSubscription

        input.add(event);
      },
    );
  }

  dispose() {
    _controller.close();
  }

  favoriteUpdate(Games item) {
    item.favorito = item.favorito + 1;
    item.reference.set(item.toMap());
  }

  //async transforma uma função parecida com o future... onde vai
  create(String titulo, int favorito, String descricao) async {
    //vai esperar o GamesService ser execultado para retornar
    await GamesService().create(Games(titulo, favorito, descricao));
  }

  delete(Games item) {
    item.reference.delete();
  }
}
