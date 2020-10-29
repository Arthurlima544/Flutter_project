import 'package:src/models/ListaGamesModels.dart';

abstract class ListaGamesServiceInterface {
  //esses abaixo são métodos da minha abstract class?
  //Stream  de listas de objetos Games(titulo,favorito)
  Stream<List<Games>> getList();
  //lida com erros
  Future<void> create(Games game);
}
