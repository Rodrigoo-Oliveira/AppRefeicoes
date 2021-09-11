import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';


class SettingsScreen extends StatefulWidget {

  final Function(Settings) onSettingsChanged;

  const SettingsScreen(this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {

  var settings = Settings();

  Widget _createSwitch(
    String title, 
    String subtitle, 
    bool value, 
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle), 
      value: value, 
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChanged(settings);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _createSwitch(
                  'Sem Glutén', 
                  'Exibir refeições sem glutén!', 
                  settings.isGlutenFree, 
                  (value) => setState(() => settings.isGlutenFree = value),
                ),
                _createSwitch(
                  'Sem Lactose', 
                  'Exibir refeições sem lactose!', 
                  settings.isLactoseFree, 
                  (value) => setState(() => settings.isLactoseFree = value),
                ),
                _createSwitch(
                  'Vegana', 
                  'Exibir refeições veganas!', 
                  settings.isVegan, 
                  (value) => setState(() => settings.isVegan = value),
                ),
                _createSwitch(
                  'Vegetariana', 
                  'Exibir refeições Vegetariana!', 
                  settings.isVegetarian, 
                  (value) => setState(() => settings.isVegetarian = value),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}