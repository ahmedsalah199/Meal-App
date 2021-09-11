import 'package:flutter/material.dart';
import 'package:meals_app/widget/main_drawer.dart';
class FilterScreen extends StatefulWidget {
  static const routeName = 'FilterScreen';
  final Function filters ;
   final Map <String , bool > ctvalue ;
  FilterScreen(this.filters , this.ctvalue);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}
class _FilterScreenState extends State<FilterScreen> {
  bool _isGlutenFree = false;
  bool _isVegan = false;
  bool _isVegetarian = false;
  bool _isLactoseFree = false;
  @override
  initState () {
     _isGlutenFree =  widget.ctvalue['GlutenFree'] as bool;
     _isVegan = widget.ctvalue['Vegan']as bool;
     _isVegetarian = widget.ctvalue['Vegetarian'] as bool;
     _isLactoseFree = widget.ctvalue['LactoseFree'] as bool;
    super.initState();
  }
  Widget buildListTile (String title , bool currentvalue, Function update ) {
    return SwitchListTile(
          title: Text (title),
          subtitle: Text ('Only include $title Meals'),
          value: currentvalue,
          onChanged: update() ,
        ) ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(onPressed: (){
            final Map <String , bool> selected_filter = {
            'GlutenFree': _isGlutenFree,
            'Vegan': _isVegan,
            'Vegetarian': _isVegetarian,
            'LactoseFree': _isLactoseFree,
            };

            widget.filters(selected_filter);
          } , icon: Icon(Icons.save)),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Text(
              'Adjust Your Meal Selection',
              style: Theme.of(context).textTheme.headline6,
            ),
            padding: EdgeInsets.all(20),
          ),
         buildListTile('Gluten Free', _isGlutenFree,()=>(newvalue){
           setState(() {
             _isGlutenFree = newvalue ;
           });
         }),
          buildListTile('Vegan', _isVegan,()=>(newvalue){
            setState(() {
              _isVegan = newvalue ;
            });
          }),
          buildListTile('Vegetarian', _isVegetarian,()=>(newvalue){
            setState(() {
              _isVegetarian = newvalue ;
            });
          }),
          buildListTile('LactoseFree', _isLactoseFree,()=>(newvalue){
            setState(() {
              _isLactoseFree = newvalue ;
            });
          }),




        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
