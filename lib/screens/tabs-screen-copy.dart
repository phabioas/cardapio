import 'package:cardapio/screens/categories_screen.dart';
import 'package:cardapio/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

// Deixei essa classe aqui para a ver o tabs mais simples
class TabsScreenCopy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos cozinhar?'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.category,
                ),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(
                  Icons.star,
                ),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreens(),
            FavoriteScreen([]),
          ],
        ),
      ),
    );
  }
}
