// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key, required this.onSelectScreen}) : super(key: key);
  final Function(String indentifi) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 210,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 215, 184, 225),
              Color.fromARGB(255, 255, 252, 252),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 170,
                  width: 170,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(223, 174, 58, 209),
                        Color.fromARGB(223, 152, 54, 54),
                      ],
                      end: Alignment.bottomLeft,
                      begin: Alignment.topRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 160,
                        width: 160,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: DrawerHeader(
                          margin: const EdgeInsets.only(
                            bottom: 0,
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  'https://png.pngtree.com/element_our/png/20180918/chef-cooking-fried-chicken-and-delicious-sign-png_103460.jpg'),
                            ),
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: [
                                const Color.fromARGB(255, 249, 250, 251),
                                const Color.fromARGB(255, 193, 213, 232)
                                    .withOpacity(0.5),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(),

                          // child: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Icon(
                          //       Icons.fastfood,
                          //       size: 35,
                          //     ),
                          //     SizedBox(
                          //       height: 10,
                          //     ),
                          //     Text(
                          //       'Cooking Up!',
                          //       style: TextStyle(
                          //         fontSize: 23,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                      ),
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Stack(
                          children: [
                            Container(
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Positioned(
                              right: 3.5,
                              bottom: 3.5,
                              child: Container(
                                height: 28,
                                width: 28,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  Icons.fastfood,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.restaurant,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Meals',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                  onTap: () {
                    onSelectScreen('meals');
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.settings,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    'Filter',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.black, fontSize: 20),
                  ),
                  onTap: () {
                    onSelectScreen('filters');
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
