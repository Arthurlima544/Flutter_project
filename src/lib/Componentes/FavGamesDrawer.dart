import 'package:flutter/material.dart';

class FavGamesDrawer extends StatelessWidget {
  const FavGamesDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(6, 22, 47, 1),
            ),
            accountName: Text(
              "arthur",
              style: TextStyle(
                color: Color.fromRGBO(39, 174, 194, 1),
              ),
            ),
            accountEmail: Text(
              "arthurlima544@gmail.com",
              style: TextStyle(
                color: Color.fromRGBO(39, 174, 194, 1),
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Color.fromRGBO(39, 174, 194, 1),
              child: Text(
                "AL",
                style: TextStyle(
                  color: Color.fromRGBO(6, 22, 47, 1),
                ),
              ),
            ),
          ),
          ListTile(
            title: Text("Home"),
            trailing: Icon(Icons.home),
            onTap: () => Navigator.of(context).pushNamed("/home"),
          ),
          ListTile(
            title: Text("Games favoritos"),
            trailing: Icon(Icons.favorite),
            onTap: () => Navigator.of(context).pushNamed("/listagames"),
          ),
          ListTile(
            title: Text("fechar"),
            trailing: Icon(Icons.close),
            onTap: () => Navigator.of(context).pop(),
          )
        ],
      ),
    );
  }
}
