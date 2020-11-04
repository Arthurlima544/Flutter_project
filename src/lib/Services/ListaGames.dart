import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:src/models/ListaGamesModels.dart';
import 'ListaGamesinterface.dart';

class GamesService extends ServiceInterface {
  static final _fb = FirebaseFirestore.instance;

  //* fluxo de dados assincronos
  Stream<List<Games>> getList() {
    return _fb.collection('games').snapshots().map(
      (snap) {
        return snap.docs.map((it) => Games.fromMap(it)).toList();
      },
    );
  }

  //* função assincrona que mapeia uma instancia de games e envia para o firebase atravez do metodo add
  Future<void> create(Games games) async {
    await _fb.collection('games').add(games.toMap()); //pausando a funcao
  }
}
