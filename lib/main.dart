import 'package:cardapio/screens/categories_meals_screen.dart';
import 'package:cardapio/screens/meal_detail_screen.dart';
import 'package:cardapio/screens/tabs-screen.dart';
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
      routes: {
        AppRoutes.HOME: (ctx) => TabsScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsScreen(),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: (settings) {
      //   // Caso não encontre a rota. É uma forma de lhe dar com quebras de rotas
      //   switch (settings.name) {
      //     case 'alguma-coisa':
      //       return null;
      //     case 'outra-coisa':
      //       return null;
      //     default:
      //       return MaterialPageRoute(
      //         builder: (_) {
      //           return CategoriesScreens();
      //         },
      //       );
      //   }
      // },
      // onUnknownRoute: (settings) {
      //   // Rotas dinamicas
      //   // Páginas de erro
      //   return MaterialPageRoute(
      //         builder: (_) {
      //           return CategoriesScreens();
      //         },
      //       );
      // },
    );
  }
}
