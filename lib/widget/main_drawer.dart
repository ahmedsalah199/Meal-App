import 'package:flutter/material.dart';
import 'package:meals_app/screens/filter_screen.dart';
final String imgUrl = 'assets/image/food.jpg' ;
Widget build_List_Tile (String title, IconData icon, VoidCallback fun) {

  return ListTile(
    onTap: fun,
    title: Text (title, style: TextStyle (fontSize: 24, fontFamily: 'RobotoCondensed',fontWeight: FontWeight.bold),),
    leading: Icon(icon,size: 26,),
  );
}
class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Column(
          children: [
            Container(
              // color: Theme.of(context).accentColor,
              height: 172,
              width: double.infinity,
              decoration: BoxDecoration (
                border: Border.all(color: Colors.pink,width: 3)
              ),
              child: Image.asset(imgUrl),
                  ),
            SizedBox(height: 20,),
            build_List_Tile('Meal', Icons.restaurant, () { Navigator.of(context).pushReplacementNamed('/');}),
            SizedBox(height: 20,),
            build_List_Tile('Filters', Icons.settings, () {Navigator.of(context).pushReplacementNamed(FilterScreen.routeName); }),




          ],
        ),
      ),
    );
  }
}
