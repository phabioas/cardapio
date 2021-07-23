import 'package:cardapio/components/meal_item.dart';
import 'package:cardapio/models/category.dart';
import 'package:cardapio/providers/meal_provider.dart';
import 'package:flutter/material.dart';

class CategoriesMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;

    final categoryMeals = MealProvider().getAllByCategory(category.id);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: category.color,
        title: Center(
          child: Text(category.title),
        ),
      ),
      body: ListView.builder(
        itemCount: categoryMeals.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: categoryMeals[index]);
        },
      ),
    );
  }
}
