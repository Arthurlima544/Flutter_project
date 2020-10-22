import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:src/Pages/NovoGamePage.dart';
import 'Pages/HomePage.dart';
import 'Pages/ListaGamesPage.dart';
import 'Pages/NovoGamePage.dart';

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
      routes: <String, WidgetBuilder>{
        "/home": (BuildContext context) => HomePage(),
        "/listagames": (BuildContext context) => ListaGamesPage(),
        "/novogame": (BuildContext context) => NovoGamePage(),
      },
    );
  }
}
