import 'package:flutter/material.dart';

import 'package:sell_products/screens/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //home: MealsScreen(title: 'Some category', meals: dummyMeals),

      home: TabScreen(),
    );
  }
}
