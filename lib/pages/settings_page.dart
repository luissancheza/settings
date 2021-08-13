import 'package:flutter/material.dart';
import 'package:settings/share_pref/preferencias_usuario.dart';
import 'package:settings/widgets/menu_witget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  static final String routeName = "settings";

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool? _colorSecundario;
  int? _genero;
  String _nombre = 'Pedro';

  TextEditingController? _textController;

  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    prefs.ultimaPagina = SettingsPage.routeName;
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;

    _textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  void _setSelectedRadio(int? valor) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('genero', valor!);
    _genero = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        backgroundColor:
            (prefs.colorSecundario == true) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
            title: Text('Color secundario'),
            value: _colorSecundario!,
            onChanged: (valor) {
              setState(() {
                _colorSecundario = valor;
                prefs.colorSecundario = valor;
              });
            },
          ),
          RadioListTile(
            title: Text('Masculino'),
            value: 1,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            title: Text('Femenino'),
            value: 2,
            groupValue: _genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telefono'),
              onChanged: (value) {
                setState(() {
                  _nombre = value;
                  prefs.nombreUsuario = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
