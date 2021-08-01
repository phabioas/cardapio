import 'package:cardapio/components/main_drawer.dart';
import 'package:cardapio/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  Settings settings = Settings();

  final Function(Settings) onSettingsChanged;

  SettingsScreen(this.settings, this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subTile,
    bool value,
    Function(bool)? onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subTile),
        value: value,
        onChanged: (value) {
          onChanged!(value);
          widget.onSettingsChanged(settings);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Configurações'),
          ),
        ),
        drawer: MainDrawer(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Expanded(
                child: ListView(
              children: [
                _createSwitch(
                    'Sem Glutén',
                    'Só exibe refeições sem Glúten',
                    settings.isGlutenFree,
                    (value) => setState(() => settings.isGlutenFree = value)),
                _createSwitch(
                    'Sem Lactose',
                    'Só exibe refeições sem Lactose',
                    settings.isLactoseFree,
                    (value) => setState(() => settings.isLactoseFree = value)),
                _createSwitch(
                    'Vegana',
                    'Só exibe refeições Veganas',
                    settings.isVegan,
                    (value) => setState(() => settings.isVegan = value)),
                _createSwitch(
                    'Vegetariana',
                    'Só exibe refeições Vegetarianas',
                    settings.isVegetarian,
                    (value) => setState(() => settings.isVegetarian = value)),
              ],
            ))
          ],
        ));
  }
}
