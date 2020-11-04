import 'package:cloud_firestore/cloud_firestore.dart';

class Games {
  //* fields
  String titulo;
  int favorito;
  String descricao;

  //*Referencia ao firestore de uma collection games
  DocumentReference reference;
  //* Construtor
  Games(this.titulo, this.favorito, this.descricao);

  //*Construtor que constroi uma nova instancia de Games apartir de uma estrutura de mapa..
  Games.fromMap(DocumentSnapshot document) {
    this.reference = document.reference;
    this.titulo = document.data()['titulo'];
    this.favorito = document.data()['favorito'];
    this.descricao = document.data()['descricao'];
  }
  //*Método que converte as propriedades de Games para uma string
  Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "favorito": favorito,
        "descricao": descricao,
      };
}
