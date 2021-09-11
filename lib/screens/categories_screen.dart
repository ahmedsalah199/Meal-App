import 'package:flutter/material.dart';
import 'package:meals_app/dummy_data.dart';
import 'package:meals_app/widget/categories_item.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
          padding: EdgeInsets.all(25),
          children: [
        ...DUMMY_CATEGORIES.map((e) =>
        categeries_item(e.id, e.title, e.color),
        ).toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3/2 ,
      crossAxisSpacing: 20 ,
      mainAxisSpacing: 20 ,


      ),
      ),
    );
  }
}
