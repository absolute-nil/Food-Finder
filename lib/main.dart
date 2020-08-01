import 'package:flutter/material.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import 'screens/category_meals_screen.dart';
import 'screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(235, 234, 225, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
      ),
//      home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabsScreen(),
       CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
       MealDetailScreen.routeName: (ctx) => MealDetailScreen()
      },
      // * on generate route is used if you have dynamic routes and you dont know what routes will be present
      // * used as fallback
      // onGenerateRoute: (settings) {
      //   if(settings.name == "/meal-payment"){
      //     return some page acc to need
      //   }
      //   if(settings.name == "/some other route"){
      //     return some page acc to need
      //   }
      // },
      // * if a route is not registered
      // * last resort
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
    );
  }
}
