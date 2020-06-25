import 'package:flutter/material.dart';
import '../widget/meal_item.dart';
import '../dummy_data.dart';
import '../model/meal.dart';

class CategoryMealScreen extends StatefulWidget{

 // final String id;
 // final String title;

 // CategoryMealScreen(this.id, this.title);
  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {

  String categoryTitle;
  List<Meal> displayedMeals;

  @override
void didChangeDependencies(){
final routargu = ModalRoute.of(context).settings.arguments as Map<String,String>;
    final categoryId = routargu['id'];
    categoryTitle = routargu['title'];
    displayedMeals = DUMMY_MEALS.where((meal){
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
}


  void _removeMeal(String mealId){
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
    appBar: AppBar(title: Text(categoryTitle),),
    body: ListView.builder(itemBuilder: (ctx, index){
      return MealItem(id: displayedMeals[index].id,title: displayedMeals[index].title, 
      imageUrl: displayedMeals[index].imageUrl, 
      duration: displayedMeals[index].duration, 
      complexity: displayedMeals[index].complexity, 
      affordability: displayedMeals[index].affordability,
      removeItem: _removeMeal,
      );
    },itemCount: displayedMeals.length,)
   );
  }
}