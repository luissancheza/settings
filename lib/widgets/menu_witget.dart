import 'package:flutter/material.dart';
import 'package:settings/pages/settings_page.dart';
import 'package:settings/pages/home_page.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
