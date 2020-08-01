import 'package:flutter/material.dart';
import './categories_screen.dart';
import './favourites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      child: Scaffold(
        appBar: AppBar(title: Text("Food finder"),
        bottom: TabBar(tabs: <Widget>[
          Tab(
            icon: Icon(Icons.category),
            text: "Categories",
          ),
          Tab(
            icon: Icon(Icons.star),
            text: "Favourites",
          )
          ]
          )
        ),
        body: TabBarView(
            children:<Widget>[
          CategoriesScreen(),
          FavouritesScreen()
        ]),
      ),
      length: 2,
    );
  }
}
