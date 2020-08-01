import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selctedScreenIndex = 0;

  final List<Map<String,Object>> _screens = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    { 'page': FavouritesScreen(), 'title': 'favourites'}
  ];

  void _selectScreen(int index){
    setState(() {
      _selctedScreenIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(title: Text(_screens[_selctedScreenIndex]['title'])),
        drawer: MainDrawer(),
        body: _screens[_selctedScreenIndex]['page'],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 4,
          selectedItemColor: Theme.of(context).accentColor,
          unselectedItemColor: Colors.white,
          currentIndex: _selctedScreenIndex,
          onTap: _selectScreen,
          items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("categories")
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star),
              title: Text("Your Favourites")
          )

        ],),
    );
  }
}
