import 'package:flutter/material.dart';

class NovoGamePage extends StatefulWidget {
  NovoGamePage({Key key}) : super(key: key);

  @override
  _NovoGamePageState createState() => _NovoGamePageState();
}

class _NovoGamePageState extends State<NovoGamePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Game"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: ListView(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Game",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Descricao",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
