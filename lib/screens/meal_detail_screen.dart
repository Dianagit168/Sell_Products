import 'package:flutter/material.dart';
import 'package:sell_products/model/meal.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen(
      {Key? key, required this.mealDetail, required this.onToggleFavorite})
      : super(key: key);
  final Meal mealDetail;
  final Function(Meal meal) onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mealDetail.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(mealDetail);
            },
            icon: const Icon(Icons.star),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              mealDetail.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Ingredients",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            for (final ingr in mealDetail.ingredients)
              Text(
                textAlign: TextAlign.center,
                // mealDetail.ingredients.toString(), //list of items
                ingr.toString(), //list index used foreach
                //semanticsLabel: mealDetail.ingredients.toString(),

                style:
                    const TextStyle(fontSize: 20, color: Colors.purpleAccent),
              ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              "Step",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue),
            ),
            const SizedBox(
              height: 30,
            ),
            for (final stp in mealDetail.steps)
              Text(
                stp.toString(),
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.purpleAccent,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
