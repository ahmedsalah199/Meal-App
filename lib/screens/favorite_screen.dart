import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widget/meals_item.dart';
class YourFavorites extends StatelessWidget {
List <Meal> _favoritemeals = [];
YourFavorites(this._favoritemeals);
  @override
  Widget build(BuildContext context) {
    if (_favoritemeals.isEmpty) {
      return Center(
        child : Text('You have not favorite meal yet _ start adding meals'),
      );
    }
    else return ListView.builder(
      itemBuilder: (context, int index) {
        return MealsItem(
          imageUrl: _favoritemeals[index].imageUrl,
          id: _favoritemeals[index].id,
          title: _favoritemeals[index].title,
          affordability: _favoritemeals[index].affordability,
          complexity: _favoritemeals[index].complexity,
          duration: _favoritemeals[index].duration,
        );
      },
      itemCount: _favoritemeals.length,
    );
  }
}
