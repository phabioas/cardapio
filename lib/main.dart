import 'package:cardapio/screens/categories_meals_screen.dart';
import 'package:cardapio/screens/categories_screen.dart';
import 'package:flutter/material.dart';

import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cardápio',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          canvasColor: Color.fromRGBO(255, 254, 229, 1), // cor de fundo
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                  fontSize: 18,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      home: CategoriesScreens(),
      routes: {
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
      },
    );
  }
}
