import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widget/meals_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'category_meals';
  List<Meal> mymeal;
CategoryMealsScreen (this.mymeal) ;

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  late List<Meal> displaycmeals;
  late String cat_title;

  @override
  void didChangeDependencies() {
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    cat_title = routeArg['title'] as String;
    displaycmeals = widget.mymeal.where(
          (meal) => meal.categories.contains(categoryId),
        )
        .toList();
    super.didChangeDependencies();
  }

  void resultdeletitem(String item) {
    setState(() {
      displaycmeals.removeWhere((meal) => meal.id == item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cat_title),
      ),
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return MealsItem(
            imageUrl: displaycmeals[index].imageUrl,
            id: displaycmeals[index].id,
            title: displaycmeals[index].title,
            affordability: displaycmeals[index].affordability,
            complexity: displaycmeals[index].complexity,
            duration: displaycmeals[index].duration,
          );
        },
        itemCount: displaycmeals.length,
      ),
    );
  }
}
