import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatelessWidget{

 // final String id;
 // final String title;

 // CategoryMealScreen(this.id, this.title);
  @override
  Widget build(BuildContext context) {
    final routargu = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId = routargu['id'];
    final categoryTitle = routargu['title'];
    final categoryMeal = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
   return Scaffold(
    appBar: AppBar(title: Text(categoryTitle),),
    body: ListView.builder(itemBuilder: (ctx, index){
      return MealItem(title: categoryMeal[index].title, 
      imageUrl: categoryMeal[index].imageUrl, 
      duration: categoryMeal[index].duration, 
      complexity: categoryMeal[index].complexity, 
      affordability: categoryMeal[index].affordability);
    },itemCount: categoryMeal.length,)
   );
  }

}