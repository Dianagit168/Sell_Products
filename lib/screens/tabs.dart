import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:sell_products/data/dummy_data.dart';
import 'package:sell_products/model/meal.dart';

import 'package:sell_products/screens/categoies.dart';
import 'package:sell_products/screens/filters_screen.dart';
import 'package:sell_products/screens/meals.dart';
import 'package:sell_products/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenfree: false,
  Filter.lactosfree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Meal> favoriteMeal = [];
  Map<Filter, bool> selectFilter = kInitialFilters;

  void showMessageInfo(String content) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  void toggleMealFavoriteStatus(Meal meal) {
    final isExisting = favoriteMeal.contains(meal);
    debugPrint(isExisting.toString());

    if (isExisting) {
      setState(() {
        favoriteMeal.remove(meal);
      });
      showMessageInfo('Meal is no longer a favorite.');
    } else {
      setState(() {
        favoriteMeal.add(meal);
      });
      showMessageInfo('Marked as a favorite');
    }
  }

  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  void setScreen(String indentifier) async {
    if (indentifier == 'filters') {
      Navigator.pop(context);
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => FilterScreen(
            currentFilters: selectFilter,
          ),
        ),
      );
      setState(() {
        selectFilter = result ?? kInitialFilters;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeal = dummyMeals.where((meal) {
      if (selectFilter[Filter.glutenfree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectFilter[Filter.lactosfree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      onToggleFavorite: toggleMealFavoriteStatus,
      availableMeals: availableMeal,
    );
    var activePageTitle = 'Category';
    if (selectedPageIndex == 1) {
      setState(() {
        activePage = MealsScreen(
          title: 'Your favorites',
          meals: favoriteMeal,
          onToggleFavorite: toggleMealFavoriteStatus,
        );
        activePageTitle = 'Favorites';
      });
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(activePageTitle),
      // ),
      drawer: MainDrawer(
        onSelectScreen: setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Category'),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorite',
          ),
        ],
        currentIndex: selectedPageIndex, //hightlight botton depend click index
        onTap: selectPage,
      ),
    );
  }
}
