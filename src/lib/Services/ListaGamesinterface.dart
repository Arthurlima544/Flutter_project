import 'package:src/models/ListaGamesModels.dart';

abstract class ServiceInterface {
  //esses abaixo são métodos da minha abstract class?
  //Stream  de listas de objetos Games(titulo,favorito)
  //! ?
  Stream<List<Games>> getList();
  //! ?
  Future<void> create(Games game);
}
