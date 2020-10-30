import 'package:cloud_firestore/cloud_firestore.dart';

class Games {
  String titulo;
  int favorito;
  String descricao;
  //oque é esse DocumentReference? jeito de referenciar os documentos de um determinado collection
  DocumentReference reference;

  Games(this.titulo, this.favorito, this.descricao);
  //*Construtor que constroi uma nova instancia de Games apartir de uma estrutura de mapa..
  //*Então na hora de ler os dados vou chamar essa função.
  Games.fromJson(DocumentSnapshot document) {
    this.reference = document.reference; // redundante não?
    this.titulo = document.data()['titulo'];
    this.favorito = document.data()['favorito'];
    this.descricao = document.data()['descricao'];
    print(this.reference);
  }
  //toMap é uma map do tipo Map<string, dynamic> de mapeamento que pega todos elementos
  //Método: que converte o dado de um objeto para uma string
  Map<String, dynamic> toJson() => {
        "titulo": titulo,
        "favorito": favorito,
        "descricao": descricao,
      };
}

/* class Games {
  String titulo;
  String favorito;
  String descricao;

  Games({this.titulo, this.favorito, this.descricao});

  Games.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    favorito = json['favorito'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['favorito'] = this.favorito;
    data['descricao'] = this.descricao;
    return data;
  }
} */
