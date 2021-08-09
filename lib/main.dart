import 'package:flutter/material.dart';
import 'package:settings/pages/home_page.dart';
import 'package:settings/pages/settings_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        SettingsPage.routeName: (_) => SettingsPage(),
      },
    );
  }
}
