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
            accountName: Text("arthur"),
            accountEmail: Text("arthurlima544@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text("AL"),
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
