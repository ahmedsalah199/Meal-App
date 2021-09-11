import 'package:flutter/material.dart';
import 'package:meals_app/screens/meals_item_screen.dart';
class categeries_item extends StatelessWidget {
  final String id ;
  final String title ;
  final Color color ;
  categeries_item (this.id,this.title,this.color);
  void selectcategory (BuildContext context) {
    Navigator.of(context).pushNamed(CategoryMealsScreen.routeName,
      arguments: {
      'id' : id ,
        'title' : title ,
      }
    );

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: ()=>selectcategory(context),
      child: Container (
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration (
         gradient: LinearGradient (
           colors:
           [
             color.withOpacity(.2),
             color,
           ]
           ,
           begin:Alignment.topLeft ,
           end: Alignment.bottomRight,
         ),
          borderRadius: BorderRadius.circular(15),
        ),
        child:
            Text(title , style: Theme.of(context).textTheme.headline6,),
    ),
    );
  }
}
