import 'package:cloud_firestore/cloud_firestore.dart';

class Games {
  String titulo;
  bool favorito;
  //oque é esse DocumentReference? jeito de referenciar os documentos de um determinado collection
  DocumentReference reference;

  Games(this.titulo, this.favorito);

  //! oque é esse from Map??
  //! oque é esse DocumentSnapshot?
  //! oque faz?
  Games.fromMap(DocumentSnapshot document) {
    this.reference = document.reference; // redundante não?
    this.favorito = document.data()['favorito'];
    this.titulo = document.data()['titulo'];
  }
  //toMap é uma funcao de mapeamento que une os elementos de dentro em um dicionario ou em um HashMap...
  //! será que eu estou mapeando em uma mesma variavel?
  Map<String, dynamic> toMap() => {
        "favorito": favorito,
        "titulo": titulo,
      };
}
