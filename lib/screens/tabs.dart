import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';

import 'package:sell_products/screens/categoies.dart';
import 'package:sell_products/screens/meals.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const CategoriesScreen();
    var activePageTitle = 'Category';
    if (selectedPageIndex == 1) {
      setState(() {
        activePage = const MealsScreen(title: 'Your favorites', meals: []);
        activePageTitle = 'Favorites';
      });
    }
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(activePageTitle),
      // ),
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
