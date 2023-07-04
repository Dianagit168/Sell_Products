import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sell_products/screens/tabs.dart';
import 'package:sell_products/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var glutenFreeFilterSet = false;
  var lactosFreeFilterSet = false;
  var vegetarianFilterSet = false;
  var veganFilterSet = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            // គឺជាប៊ូតុងបិតបើក
            onChanged: (isCheck) {
              setState(() {
                glutenFreeFilterSet = isCheck;
              });
            }, //click to turn on-off
            value: glutenFreeFilterSet, // auto turn off
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            //activeColor: ,
          ),
          SwitchListTile(
            // គឺជាប៊ូតុងបិតបើក
            onChanged: (isCheck) {
              setState(() {
                lactosFreeFilterSet = isCheck;
              });
            }, //click to turn on-off
            value: lactosFreeFilterSet, // auto turn off
            title: Text(
              'Lactos-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            subtitle: Text(
              'Only include lactos-free meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            //activeColor: ,
          ),
          SwitchListTile(
            // គឺជាប៊ូតុងបិតបើក
            onChanged: (isCheck) {
              setState(() {
                vegetarianFilterSet = isCheck;
              });
            }, //click to turn on-off
            value: vegetarianFilterSet, // auto turn off
            title: Text(
              'Vegetarian',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            //activeColor: ,
          ),
          SwitchListTile(
            // គឺជាប៊ូតុងបិតបើក
            onChanged: (isCheck) {
              setState(() {
                veganFilterSet = isCheck;
              });
            }, //click to turn on-off
            value: veganFilterSet, // auto turn off
            title: Text(
              'Vegen',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(),
            ),
            subtitle: Text(
              'Only include vegen meals',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
            //activeColor: ,
          ),
        ],
      ),
    );
  }
}
