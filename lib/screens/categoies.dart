import 'package:flutter/material.dart';
import 'package:sell_products/data/dummy_data.dart';
import 'package:sell_products/model/category.dart';

import '../widgets/category _grid_item.dart';
import 'meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);
  void selectCategory(BuildContext context, CCategory category) {
    final filteredMeals = dummyMeals
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              MealsScreen(title: category.name, meals: dummyMeals),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          // avialableCatagoies.map((categorylo) => CategoryGridItem(category: categorylo)).toList()
          for (final categoryloop in avialableCatagoies)
            CategoryGridItem(
              category: categoryloop,
              onSelectCategory: () {
                selectCategory(context, categoryloop);
              },
            )
        ],
      ),
    );
  }
}
