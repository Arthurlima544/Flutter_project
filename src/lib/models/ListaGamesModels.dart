import 'package:cloud_firestore/cloud_firestore.dart';

class Games {
  String titulo;
  bool favorito;
  DocumentReference reference;

  Games(this.titulo, this.favorito);

  Games.fromMap(DocumentSnapshot document) {
    this.reference = document.reference;
    this.favorito = document.data()["favorito"];
    this.titulo = document.data()['titulo'];
  }

  Map<String, dynamic> toMap() => {
        "favorito": favorito,
        "titulo": titulo,
      };
}
