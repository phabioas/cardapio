import 'package:cardapio/components/main_drawer.dart';
import 'package:cardapio/screens/categories_screen.dart';
import 'package:cardapio/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  final List<Map<String, Object>> _screens = [
    {
      'title': 'Lista de Categoria',
      'screen': CategoriesScreens(),
    },
    {
      'title': 'Favoritos',
      'screen': FavoriteScreen(),
    },
  ];

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title'] as String),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
