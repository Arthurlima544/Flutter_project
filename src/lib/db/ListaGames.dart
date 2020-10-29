import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:src/models/ListaGamesModels.dart';
import 'ListaGamesinterface.dart';

class GamesService extends ListaGamesServiceInterface {
  static final _fb = FirebaseFirestore.instance;

  Stream<List<Games>> getList() {
    return _fb.collection('games').snapshots().map((snap) {
      return snap.docs.map((it) => Games.fromMap(it)).toList();
    });
  }

  Future<void> create(Games games) {
    return _fb.collection('games').add(games.toMap());
  }
}
