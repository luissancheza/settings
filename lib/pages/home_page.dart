import 'package:flutter/material.dart';
import 'package:settings/pages/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static final String routeName = "home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
      ),
      drawer: _crearMenu(context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color secundario: "),
          Divider(),
          Text("Genero: "),
          Divider(),
          Text("Nombre de usuario: "),
        ],
      ),
    );
  }

  Drawer _crearMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.pages,
              color: Colors.blueAccent,
            ),
            title: Text('Pages'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.party_mode,
              color: Colors.blueAccent,
            ),
            title: Text('Party'),
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blueAccent,
            ),
            title: Text('People'),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blueAccent,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
