import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:src/models/ListaGamesModels.dart';
import 'ListaGamesinterface.dart';

class GamesService extends ListaGamesServiceInterface {
  static final _fb = FirebaseFirestore.instance;

  // !Que viagem é essa?
  Stream<List<Games>> getList() {
    return _fb.collection('games').snapshots().map((snap) {
      return snap.docs.map((it) => Games.fromMap(it)).toList();
    });
  }

  //Função assyncrona que cria um documento na collection games
  // a variavel games é uma instancia e ela possue um metodo to map..
  // Future<void> não produz um valor usável.
  Future<void> create(Games games) async {
    await _fb.collection('games').add(games.toMap());
  }
}
