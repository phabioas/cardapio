import 'package:cardapio/models/settings.dart';
import 'package:cardapio/providers/meal_provider.dart';
import 'package:cardapio/screens/categories_meals_screen.dart';
import 'package:cardapio/screens/meal_detail_screen.dart';
import 'package:cardapio/screens/settings_screen.dart';
import 'package:cardapio/screens/tabs-screen.dart';
import 'package:flutter/material.dart';

import 'models/meal.dart';
import 'utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Meal> _avaliableMeals = MealProvider().getAll();
  List<Meal> _favoriteMeals = [];

  void _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _avaliableMeals = MealProvider().getAll().where((meal) {
        final filterGlutten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGlutten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool isFavorite(Meal meal) {
    return _favoriteMeals.contains(meal);
  }

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
        AppRoutes.HOME: (ctx) => TabsScreen(_favoriteMeals),
        AppRoutes.CATEGORIES_MEALS: (ctx) =>
            CategoriesMealsScreen(_avaliableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(_toggleFavorite, isFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(settings, _filterMeals),
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
