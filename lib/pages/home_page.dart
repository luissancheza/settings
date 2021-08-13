import 'package:flutter/material.dart';
import 'package:settings/share_pref/preferencias_usuario.dart';
import 'package:settings/widgets/menu_witget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = "home";
  final prefs = new PreferenciasUsuario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero: ${prefs.genero}"),
          Divider(),
          Text("Nombre de usuario: ${prefs.nombreUsuario}"),
        ],
      ),
    );
  }
}
