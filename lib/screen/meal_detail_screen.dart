import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget{


  Widget buildSectionTitle(BuildContext context , text){
    return Container(child: Text(text, 
    style : Theme.of(context).textTheme.headline6,), 
    margin: EdgeInsets.symmetric(vertical: 10),);
  }

  Widget buildContainer(BuildContext context, Widget child){
    return 
    Container(
          decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          height: (MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top - MediaQuery.of(context).padding.bottom)*0.2,
          width: MediaQuery.of(context).size.width* 0.8, 
          child: child);
  }
  @override
  Widget build(BuildContext context){
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}'),),
      body: SingleChildScrollView(
              child: Column(children: <Widget>[
          Container(decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 300,
            width: double.infinity,
            child: Image.network(selectedMeal.imageUrl, fit: BoxFit.cover,),
          ),
          buildSectionTitle(context, 'Ingedrients'),
          buildContainer(context, ListView.builder(itemBuilder: (ctx, index) => Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Text(selectedMeal.ingredients[index]))
          ),
            itemCount: selectedMeal.ingredients.length,
          ),),
           buildSectionTitle(context, 'Steps'),
           buildContainer(context, ListView.builder(
             itemBuilder: (ctx, index) => Column(
               children: [
                 ListTile(
                   leading: CircleAvatar(child: Text('# ${index+1}')),
                   title: Text(selectedMeal.steps[index]),
                 ),Divider()
               ],
             ),
           
            itemCount: selectedMeal.steps.length,
           ))
        ],),
      )
      );
  }
}