import 'package:flutter/material.dart';

class CategoryMealScreen extends StatelessWidget{

 // final String id;
 // final String title;

 // CategoryMealScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routargu = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final id = routargu['id'];
    final title = routargu['title'];
   return Scaffold(
    appBar: AppBar(title: Text(title),),
    body: Center(
      child: Text('recepy spelled wrong'),
    ),
   );
  }

}