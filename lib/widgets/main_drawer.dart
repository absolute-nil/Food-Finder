import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function handleTap){
    return ListTile(
      onTap: handleTap,
      leading: Icon(icon, size: 26,),
      title: Text(title, style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(30),
            color: Theme.of(context).accentColor,
            child: Text("Food's Bae",
                style: TextStyle(color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.w900, fontSize: 30)),
          ),
          SizedBox(height: 20,),
          buildListTile("Meals", Icons.restaurant, (){ Navigator.of(context).pushNamed("/");}),
          buildListTile("Preferences", Icons.settings, (){ Navigator.of(context).pushNamed(FiltersScreen.routeName);})

        ],
      ),
    );
  }
}
