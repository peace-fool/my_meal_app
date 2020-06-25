import 'package:flutter/material.dart';
import 'package:my_meals/widget/main_drawer.dart.dart';

class FilterScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(title: Text('Filters'),),
      body: Center(child: Text('Some Filters!!'),)
      );
  }
}