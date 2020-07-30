import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meals Page"),),
      body: Center(
        child: Container(
        child: Text("This is meals page"),
    ),
      )
    );
  }
}