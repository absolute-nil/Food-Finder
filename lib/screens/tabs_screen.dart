import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {


  final List<Meal> favouriteMeals;


  TabsScreen(this.favouriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;

  List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavouritesScreen(widget.favouriteMeals), 'title': 'favourites'}
    ];
    super.initState();
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_screens[_selectedScreenIndex]['title'])),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 4,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        onTap: _selectScreen,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), title: Text("categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text("Your Favourites"))
        ],
      ),
    );
  }
}
