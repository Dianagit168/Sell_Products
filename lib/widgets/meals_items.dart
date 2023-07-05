import 'package:flutter/material.dart';
import 'package:sell_products/model/meal.dart';

import 'package:sell_products/widgets/meal_item_trail.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItems extends StatelessWidget {
  const MealItems({
    Key? key,
    required this.mealI,
    required this.onSelectMealToDetail,
  }) : super(key: key);
  final Meal mealI;
  final Function(Meal mealI) onSelectMealToDetail;

  String get complexityText {
    return mealI.complexity.name[0] + mealI.complexity.name.substring(1);
  }

  String get affordabilityText {
    return mealI.affordability.name[0] + mealI.complexity.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      child: InkWell(
        onTap: () {
          onSelectMealToDetail(mealI);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(mealI.imageUrl),
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 44,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 36, 25, 28).withOpacity(0.5),
                      Color.fromARGB(255, 239, 115, 156).withOpacity(0.5),
                    ],
                    end: Alignment.topRight,
                    begin: Alignment.bottomLeft,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      mealI.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        MealItemTrail(
                          icon: Icons.schedule,
                          label: mealI.duration.toString() + ' min',
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        MealItemTrail(
                          icon: Icons.work,
                          label: complexityText,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        MealItemTrail(
                          icon: Icons.attach_money,
                          label: affordabilityText,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
