import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();

    return Scaffold(
        appBar: AppBar(title: Text(categoryTitle)),
        body: ListView.builder(
            itemBuilder: (ctx, i) {
              return MealItem(
                id: categoryMeals[i].id,
                title: categoryMeals[i].title,
                imageUrl: categoryMeals[i].imageUrl,
                duration: categoryMeals[i].duration,
                affordability: categoryMeals[i].affordability,
                complexity: categoryMeals[i].complexity,
              );
            },
            itemCount: categoryMeals.length));
  }
}
