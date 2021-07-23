import 'package:cardapio/components/category_item.dart';
import 'package:cardapio/providers/category_provider.dart';
import 'package:flutter/material.dart';

class CategoriesScreens extends StatelessWidget {
  final listCategory =
      CategoriaProvider().getAll().map((cat) => CategoryItem(cat)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Vamos cozinhar?')),
      ),
      body: GridView(
        padding: EdgeInsets.all(25),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: listCategory,
      ),
    );
  }
}
