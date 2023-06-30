import 'package:flutter/material.dart';

import 'package:sell_products/model/category.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem(
      {Key? key, required this.category, required this.onSelectCategory})
      : super(key: key);
  final CCategory category; // Category is class model
  final void Function() onSelectCategory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //use to tap on container to work
      //borderRadius: BorderRadius.circular(16),
      //splashColor: Theme.of(context).primaryColor,

      onTap: onSelectCategory,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              colors: [
                category.color.withOpacity(0.55),
                category.color.withOpacity(0.9),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(category.name.toUpperCase()),
        ),
      ),
    );
  }
}
