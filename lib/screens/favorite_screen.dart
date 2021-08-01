import 'package:cardapio/components/meal_item.dart';
import 'package:cardapio/models/meal.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeals;

  const FavoriteScreen(this._favoriteMeals);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _favoriteMeals.length,
      itemBuilder: (ctx, index) {
        return MealItem(meal: _favoriteMeals[index]);
      },
    );
  }
}
