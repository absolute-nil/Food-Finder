import 'package:flutter/material.dart';
import '../data/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";
  final Function isFavourite;
  final Function toggleFavourite;

  MealDetailScreen({this.isFavourite, this.toggleFavourite});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.headline6.copyWith(color: Colors.black),
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blueGrey),
            borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
        appBar: AppBar(title: Text("${selectedMeal.title}")),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    selectedMeal.imageUrl,
                    fit: BoxFit.cover,
                  )),
              buildSectionTitle(context, "Ingredients"),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  elevation: 2,
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              )),
              buildSectionTitle(context, "Steps"),
              buildContainer(ListView.builder(
                itemBuilder: (ctx, index) => Column(children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("# ${index + 1}"),
                    ),
                    title: Text(selectedMeal.steps[index]),
                  ),
                  Divider()
                ]),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            toggleFavourite(mealId);
          },
          child: Icon(!isFavourite(mealId)? Icons.star_border: Icons.star),
        ));
  }
}
