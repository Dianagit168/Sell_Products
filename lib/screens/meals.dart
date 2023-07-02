import 'package:flutter/material.dart';
import 'package:sell_products/model/meal.dart';
import 'package:sell_products/screens/meal_detail_screen.dart';
import 'package:sell_products/widgets/meals_items.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen(
      {Key? key,
      required this.title,
      required this.meals,
      required this.onToggleFavorite})
      : super(key: key);
  final String title;
  final List<Meal> meals;
  final Function(Meal meal) onToggleFavorite;
  void selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealDetailScreen(
            mealDetail: meal,
            onToggleFavorite: onToggleFavorite,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    Widget contant = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Page not found...!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Please add to favorite',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
    if (meals.isNotEmpty) {
      contant = ListView.builder(
        itemBuilder: (context, index) {
          debugPrint(meals[index].title);
          return MealItems(
            mealI: meals[index],
            onSelectMealToDetail: (mealI) {
              selectMeal(context, mealI);
            },
          );
        },
        itemCount: meals.length,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: contant,
    );
  }
}
