import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meals_item_screen.dart';
import 'package:meals_app/screens/meals_details_screen.dart';

class MealsItem extends StatelessWidget {
  final String imageUrl;
  final String id;
  final int duration;
  final Affordability affordability;
  final Complexity complexity;
  final String title;

  MealsItem({
    required this.imageUrl,
    required this.id,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.title});

  String get complextytext {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'unknown';
    }
  }

  String get affordabilitytext {
    switch (affordability) {
      case Affordability.Pricey:
        return 'Pricey';
        break;
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      default:
        return 'unknown';
    }
  }

  void selectmeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetailsScreen.routeName,
    arguments: id,
    ).then((value) { //if (value != null ) fun(value)
       ;});}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=> selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                        alignment: Alignment.center,
                        width: 220,
                        color: Colors.black54,
                        padding:
                        EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        child: Text(
                          title,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ))),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$complextytext'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$affordabilitytext'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
