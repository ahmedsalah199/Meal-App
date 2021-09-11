import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/filter_screen.dart';
import 'package:meals_app/screens/meals_item_screen.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import 'package:meals_app/screens/tab_screen.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
// hide status bar
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();

}
class MyAppState extends State <MyApp> {
  Map <String , bool> _filters = {
   'GlutenFree' : false,
   'Vegan' : false,
   'Vegetarian' : false,
   'LactoseFree' : false,
  };
  List <Meal> filtermeal = DUMMY_MEALS ;
   set_filters (Map <String , bool> filterdata) {
    setState(() {
     _filters = filterdata ;
       filtermeal = DUMMY_MEALS.where(
              (meal) {
                if (_filters['GlutenFree' ] == true && !meal.isGlutenFree ) {return false ;}
                if (_filters['Vegan' ] == true && !meal.isVegan ) {return false ;}
                if (_filters['Vegetarian' ] == true && !meal.isVegetarian ) {return false ;}
                if (_filters['LactoseFree' ] == true && !meal.isLactoseFree ) {return false ;}
                return true ;
              }
      ).toList();
    });
  }
  List <Meal> favorite_meal = [];

   void set_favorite_meal (String id) {

     final index = favorite_meal.indexWhere((meal) => meal.id == id);
     if (index >=0) {
       setState(() {
         favorite_meal.removeAt(index);
         git init
       });
     }
     else {
       setState(() {
         favorite_meal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == id));

       });
     }
   }
   bool isfavorite (String mealid) {
     return favorite_meal.any((meal) => meal.id == mealid);
   }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
            headline6: TextStyle(
              fontSize: 20,
              fontFamily: 'RobotoCondensed',
              fontWeight: FontWeight.bold,
            ),
          )),
      routes: {
        '/': (context) => TabScreen(favorite_meal),
        CategoryMealsScreen.routeName: (context) => CategoryMealsScreen(filtermeal),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(set_favorite_meal,isfavorite),
        FilterScreen.routeName: (context) => FilterScreen(set_filters,_filters),
      },
    );
  }
}


//
// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Meal App"),
//       ),
//       body: null,
//     );
//   }
// }
