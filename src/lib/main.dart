import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/HomePage/HomePage.dart';
import 'Pages/ListaGames/ListaGamesPage.dart';
import 'Pages/NovoGame/NovoGamePage.dart';

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
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
      // TODO: vou realmente utilzar essas rotas desse jeito?
      routes: {
        "/home": (context) => HomePage(),
        "/listagames": (context) => ListaGamesPage(),
        "/novogame": (context) => NovoGamePage(),
      },
    );
  }
}
