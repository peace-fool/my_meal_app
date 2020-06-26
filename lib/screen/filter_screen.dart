import 'package:flutter/material.dart';
import 'package:my_meals/widget/main_drawer.dart.dart';

class FilterScreen extends StatefulWidget{
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  Widget _buildSwitchListTile(String title, String discription, bool currentValue, Function update){
    return  SwitchListTile(value: currentValue, onChanged: update, title: Text(title),subtitle: Text(discription),);
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Filters'),),
      body: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: Text('Adjust your meals here', style: Theme.of(context).textTheme.headline6,),
          ),
        Expanded(child: ListView(
          children: <Widget>[
           _buildSwitchListTile('gluten free', 'only gluten free meals included', _glutenFree, (newValue){
             setState(() {
               _glutenFree = newValue;
             });
           }),
           _buildSwitchListTile('Vegetarian', 'only vegetarian meals included', _vegetarian, (newValue){
             setState(() {
               _vegetarian = newValue;
             });
           }),
           _buildSwitchListTile('vegan', 'only vegan meals included', _vegan, (newValue){
             setState(() {
               _vegan = newValue;
             });
           }),
           _buildSwitchListTile('Lactose free', 'only lactose free meals included', _lactoseFree, (newValue){
             setState(() {
               _lactoseFree = newValue;
             });
           }),
          ],
        ))

      ],),
      );
  }
}