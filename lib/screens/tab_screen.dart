import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/favorite_screen.dart';
import 'package:meals_app/widget/main_drawer.dart';

class TabScreen extends StatefulWidget {
  List <Meal> favoritemeal = [];
TabScreen(this.favoritemeal);
  @override
  _TabScreenState createState() => _TabScreenState();
}




class _TabScreenState extends State<TabScreen> {
  int select_item = 0;

  late List  page ;
  @override
  void initState () {
    page =
    [
      {
        'page': CategoryScreen(),
        'title' : "Categories"
      },
      {
        'page': YourFavorites(widget.favoritemeal),
        'title' : "Your Favorites"
      },
    ];
super.initState();
  }
  void select_tab(int index) {
    setState(() {
      select_item = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(page[select_item]['title']),
      ),
      body: page[select_item]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: select_tab,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: select_item,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favorites')
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
