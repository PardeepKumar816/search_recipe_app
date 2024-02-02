import 'package:flutter/material.dart';
import 'package:recipe_search_app/data/models/recipe_model.dart';
import 'package:recipe_search_app/presentation/widgets/recipes_box.dart';

class RecipesListWidget extends StatelessWidget {
  const RecipesListWidget({
    Key? key,required this.recipesList
  }) : super(key: key);

  final List<Results> recipesList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children:[
                 ...recipesList.map((e) {
                   // show each element with title, and image
                  return RecipeBox(element: e,);
                }).toList() ,
              ]
          ),
        )

    );
  }
}