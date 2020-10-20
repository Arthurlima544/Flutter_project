import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Pages/HomePage.dart';
import 'Pages/ListaGamesPage.dart';

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
        "/listaGames": (BuildContext context) => ListaGamesPage(),
      },
    );
  }
}
