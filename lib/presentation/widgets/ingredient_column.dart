import 'package:flutter/material.dart';
import 'package:recipe_search_app/data/models/recipe_details_model.dart';
import 'ingredients_list.dart';

class IngredientColumn extends StatelessWidget {
  const IngredientColumn({
    Key? key,
    required this.model,
  }) : super(key: key);

  final RecipeDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:[
        // if ingredient list is not empty then show ingredient list
        if(model.extendedIngredients!.isNotEmpty)
        ... model.extendedIngredients!.map((ingredient) {
          return IngredientsList(ingredient: ingredient,);
        }).toList(),
        // if ingredient list is empty then show Ingredients not available text
        if(model.extendedIngredients!.isEmpty)
         const Center(child: Text("Ingredients not available"),)
      ],
    );
  }
}