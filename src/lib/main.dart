import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:src/Views/GameEspecifico/GameFavoritoPage.dart';
import 'Views/HomePage/HomePage.dart';
import 'Views/ListaGames/ListaGamesPage.dart';

//* inicializando o Firebase
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "my drawer",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Color.fromRGBO(8, 188, 205, 1),
      ),
      home: HomePage(),
      routes: {
        "/home": (context) => HomePage(),
        "/listagames": (context) => ListaGamesPage(),
        "/novogame": (context) => GameFavoritoPage(),
      },
    );
  }
}
