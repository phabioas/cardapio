import 'package:cardapio/components/main_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Configurações'),
        ),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text(
          'configurar',
        ),
      ),
    );
  }
}
