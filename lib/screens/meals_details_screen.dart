import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = 'MealDetail';
Function favoritemeal ;
final  isfavorite ;
MealDetailsScreen(this.favoritemeal,this.isfavorite);

  Widget buildtitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildcontainertext(Widget child) {
    return Container(
      height: 150,
      width: 300,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }


  @override
  Widget build(BuildContext context) {
    final String routArg = ModalRoute.of(context)!.settings.arguments as String;
    final mealsFilter = DUMMY_MEALS.firstWhere((meal) => meal.id == routArg);
    return Scaffold(
      appBar: AppBar(
        title: Text(mealsFilter.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // padding: EdgeInsets.all(15),
              child: Image.network(
                mealsFilter.imageUrl,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            buildtitle(context, 'Ingredients'),
            buildcontainertext(
              ListView.builder(
                itemBuilder: (conext, int index) {
                  return Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 10),
                      child: Text('${mealsFilter.ingredients[index]}'),
                    ),
                  );
                },
                itemCount: mealsFilter.ingredients.length,
              ),
            ),
            buildtitle(context, 'Steps'),
            buildcontainertext(
              ListView.builder(
                itemBuilder: (conext, int index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text('${mealsFilter.steps[index]}'),
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                      ),
                      Divider(
                        height: 20,
                        thickness: 3,
                      )
                    ],
                  );
                  //   Card(
                  //   color: Theme.of(context).accentColor,
                  //   child: Padding(
                  //     padding: const EdgeInsets.symmetric(vertical: 5.0 , horizontal: 10),
                  //     child: Text ('${mealsFilter.steps[index]}'),
                  //   ),
                  // );
                },
                itemCount: mealsFilter.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:
            (){

          favoritemeal(routArg);},
        child: Icon(
          isfavorite (routArg) ? Icons.star : Icons.star_border
        ),
      ),
    );
  }
}
