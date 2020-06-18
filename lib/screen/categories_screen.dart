import 'package:flutter/material.dart';
import '../dummy_data.dart';
import '../widget/category_items.dart';
class CategoriesScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Meals!!')),
      body: GridView(children: DUMMY_CATEGORIES.map((catData)=>CategoryItems(catData.id, catData.title, catData.color)).toList(), 
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 200,
      childAspectRatio: 3/2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(20),
      ),
      );
  }
}