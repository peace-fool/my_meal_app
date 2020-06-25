import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget{
 Widget buildListTile(String title, IconData icon, Function tapAction){
   return ListTile(leading: Icon(icon, size: 26,),
      title: Text(title, style: TextStyle(fontFamily: 'RobotoCondensed', fontSize: 24, fontWeight: FontWeight.bold)),
      onTap: tapAction,
      );
 }
  @override
  Widget build(BuildContext context){
  return Drawer(child: Column(children: <Widget>[
    Container(
      alignment: Alignment.centerLeft,
      height: 120,
      width: double.infinity,
      padding: EdgeInsets.all(20),
      color: Theme.of(context).accentColor,
      child: Text('Cooking up!!', style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30, color: Theme.of(context).primaryColor)),
      ),
      SizedBox(height: 20,),
      buildListTile('Meals', Icons.restaurant, (){
        Navigator.of(context).pushReplacementNamed('/');
      }),
      buildListTile('Settings', Icons.settings, (){
        Navigator.of(context).pushReplacementNamed('/filter-screen');
      })
      
  ],));
  }
}